resource "virtualbox_vm" "node" {
  count     = 2
  name      = format("node-%02d", count.index + 1)
  image     = "D:\\Soft\\Образы\\ubuntu-20.04.4-live-server-amd64.iso"
  cpus      = 2
  memory    = "512 mib"
  user_data = "ubuntu:${file("~/.ssh/yandex_key_ssh.pub")}"

  network_adapter {
    type           = "bridged"
    host_interface = "en0"
  }
}

