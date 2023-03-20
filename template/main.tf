

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
