resource "google_compute_network" "securekube_vpc" {
  name                    = "securekube-vpc"
  auto_create_subnetworks = false
}
resource "google_compute_firewall" "securekube_internal" {
  name    = "securekube-allow-internal"
  network = google_compute_network.securekube_vpc.id

  direction = "INGRESS"

  source_ranges = [
    "10.10.0.0/24",
    "10.20.0.0/16",
    "10.30.0.0/20"
  ]

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }
}
resource "google_compute_subnetwork" "securekube_subnet" {
  name          = "securekube-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.securekube_vpc.id

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.20.0.0/16"
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.30.0.0/20"
  }
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_container_cluster" "securekube" {
  name     = var.cluster_name
  location = var.region

  resource_labels = {
    project     = "securekube"
    environment = "dev"
    managed_by  = "terraform"
    security    = "devsecops"
  }

  network    = google_compute_network.securekube_vpc.id
  subnetwork = google_compute_subnetwork.securekube_subnet.id

  deletion_protection = false

  enable_intranode_visibility = true

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  master_authorized_networks_config {
    cidr_blocks {
      display_name = "admin-workstation"
      cidr_block   = var.admin_cidr
    }
  }

  binary_authorization {
    evaluation_mode = "PROJECT_SINGLETON_POLICY_ENFORCE"
  }




  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  node_config {
    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }

    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }
}