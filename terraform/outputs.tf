output "vpc_name" {
  description = "Name of the SecureKube VPC"
  value       = google_compute_network.securekube_vpc.name
}

output "subnet_name" {
  description = "Name of the SecureKube subnet"
  value       = google_compute_subnetwork.securekube_subnet.name
}

output "gke_cluster_name" {
  description = "Name of the SecureKube GKE cluster"
  value       = google_container_cluster.securekube.name
}

output "gke_cluster_endpoint" {
  description = "GKE cluster endpoint"
  value       = google_container_cluster.securekube.endpoint
  sensitive   = true
}