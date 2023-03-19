resource "virtualbox_vm" "node" {
  count     = 2
  name      = format("node-%02d", count.index + 1)
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20230317.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "512 mib"
  user_data = "ubuntu:${file("~/.ssh/yandex_key_ssh.pub")}"

  network_adapter {
    type           = "bridged"
    host_interface = "en0"
  }
}

