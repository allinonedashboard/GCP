resource "google_service_account" "default" {
  account_id   = "service_account_id"
  display_name = "Service Account"
}

resource "google_compute_instance" "gke-jumphost" {
  name         = "gke-jumphost"
  project      = var.project
  machine_type = "e2-micro"
  tags         = ["ssh"]
  service_account {
    email = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }
  network_interface {
    network      = var.vpc_selflink
    subnetwork   = var.subnet_selflink
    access_config {}
  }
//  metadata = {
//    ssh-keys        = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
//    startup-script  = file("./startup-script")
//  }
  ## Copying files for k8s pod and service sample app
  provisioner "file" {
    source = "./sampleapp"
    destination = "/home/centos/"

    connection {
      type = "ssh"
      user = "centos"
      host = google_compute_instance.gke-jumphost.network_interface.0.access_config.0.nat_ip
      //private_key = file("~/.ssh/id_rsa")
      timeout = "3m"
      agent = "false"
    }
  }
}
