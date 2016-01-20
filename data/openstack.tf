variable "image" {
    default = "cb-centos71-amb212-2016-01-13-amb221-krisz"
}

variable "key" {
    default = "seq-master"
}

variable "flavor" {
    default= "m1.medium"
}

variable "name" {
    default= "docker-test"
}

variable "network" {
    default= "admin-net"
}

resource "openstack_compute_floatingip_v2" "floatip_1" {
  pool = "ext-net"
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
