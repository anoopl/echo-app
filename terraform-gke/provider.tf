#export GOOGLE_CLOUD_KEYFILE_JSON=abstract-botany-256606-e9d000fafdc6.json
provider "google" {
  credentials = "${file("abstract-botany-256606-e9d000fafdc6.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}
