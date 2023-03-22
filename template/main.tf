

resource "yandex_compute_instance" "vm-3" {
  name = "build"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80d7fnvf399b1c207j"
    }
  }

  network_interface {
    subnet_id = "e9be3mce2q6ov39vv61e"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_key_ssh.pub")}"
  }
}

resource "yandex_compute_instance" "vm-4" {
  name = "deploy"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80d7fnvf399b1c207j"
    }
  }

  network_interface {
    subnet_id = "e9be3mce2q6ov39vv61e"
    nat       = true
  }

  metadata = {
     ssh-keys = "ubuntu:${file("~/.ssh/yandex_key_ssh.pub")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}


output "external_ip_address_vm_1" {
  value = "192.168.10.100"
}

output "external_ip_address_vm_2" {
  value = "192.168.10.101"
}
