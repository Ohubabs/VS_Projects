resource "kubernetes_service_v1" "tesla-svc" {
  metadata {
    name = "tesla-svc"
  }
  spec {
    selector = {
      app = "tesla"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
