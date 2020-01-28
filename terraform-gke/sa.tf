data "google_project" "project" {}

resource "google_service_account" "gke_service_account" {
  account_id   = "${var.service_account}"
  display_name = "GKE Service Account"
}

resource "google_project_iam_custom_role" "gke_admin" {
  role_id     = "gke_admin"
  title       = "gke_admin"
  description = "GKE Administrator Custom Role"
  permissions = ["compute.disks.create", "compute.firewalls.create", "compute.firewalls.delete", "compute.firewalls.get", "compute.instanceGroupManagers.get", "compute.instances.create", "compute.instances.delete", "compute.instances.get", "compute.instances.setMetadata", "compute.instances.setServiceAccount", "compute.instances.setTags", "compute.machineTypes.get", "compute.networks.create", "compute.networks.delete", "compute.networks.get", "compute.networks.updatePolicy", "compute.subnetworks.create", "compute.subnetworks.delete", "compute.subnetworks.get", "compute.subnetworks.setPrivateIpGoogleAccess", "compute.subnetworks.update", "compute.subnetworks.use", "compute.subnetworks.useExternalIp", "compute.zones.get", "container.clusters.create", "container.clusters.delete", "container.clusters.get", "container.clusters.update", "container.operations.get", "stackdriver.resourceMetadata.write", "logging.logEntries.create", "monitoring.metricDescriptors.create", "monitoring.metricDescriptors.get" , "monitoring.metricDescriptors.list", "monitoring.monitoredResourceDescriptors.get" ,"monitoring.monitoredResourceDescriptors.list", "monitoring.timeSeries.create"]
}

resource "google_project_iam_binding" "gke_binding" {
  role = "projects/${data.google_project.project.project_id}/roles/${google_project_iam_custom_role.gke_admin.role_id}"

  members = [
    "serviceAccount:${google_service_account.gke_service_account.email}",
  ]
}