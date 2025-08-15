locals {
  is_control_plane_iscsi_type = can(regex("^BM\\..*$", var.control_plane_shape))
  is_compute_iscsi_type       = can(regex("^BM\\..*$", var.compute_shape))

  current_cp_count      = length(data.oci_load_balancer_backends.openshift_api_backend.backends)
  current_compute_count = length(data.oci_load_balancer_backends.openshift_apps_ingress_http.backends) - local.current_cp_count

  day_2_image_name = format("%s-day-2", var.cluster_name)

  cluster_instance_role_tag_namespace = var.cluster_instance_role_tag_namespace != "" ? var.cluster_instance_role_tag_namespace : format("openshift-%s", var.cluster_name)
}
