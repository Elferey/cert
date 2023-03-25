terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"
  cloud_id  = "b1gpd418mt0mlakofp5l"
  folder_id = "b1g7ns5v094sfsed8mvd"
}
