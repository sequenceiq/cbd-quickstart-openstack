variable "image" {
    default = "${var.image}"
}

variable "key" {
    default = "${var.key}"
}

variable "flavor" {
    default= "${var.flavor}"
}

variable "name" {
    default= "${var.name}"
}

variable "network" {
    default= "${var.network}"
}

resource "openstack_compute_floatingip_v2" "floatip_1" {
  pool = "ext-net"
}

provider "openstack" {
    user_name  = "${var.user_name}"
    tenant_name = "${var.tenant_name}"
    password  = "${var.password}"
    auth_url  = "${var.auth_url}"
}

resource "openstack_compute_instance_v2" "test" {
    name = "${var.image}-test"
    image_name = "${var.image}"
    flavor_name = "${var.flavor}"
    key_pair = "${var.key}"
    network = {
        name = "${var.network}"
    }
    floating_ip = "${openstack_compute_floatingip_v2.floatip_1.address}"
}
