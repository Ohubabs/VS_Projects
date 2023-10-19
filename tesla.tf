resource "kubernetes_deployment_v1" "nexus-deploy" {
  metadata {
    name = "tesla"
  }

  spec {
    replicas = 1
    strategy {
        type = "RollingUpdate"
        rolling_update {
            max_surge = 1
            max_unavailable = 1
        }
      }
    min_ready_seconds = 30
    selector {
      match_labels = {
        app = "tesla"
      }
    }

    template {
      metadata {
        labels = {
          app = "tesla"
        }
      }

      spec {
        container {
          image = "princebabs/tesla:2"
          name  = "tesla-pod"

          port {
            container_port = 80
          }
          resources {
            limits = {
              cpu    = ".5"
              memory = "500Mi"
            }
            requests = {
              cpu    = ".5"
              memory = "500Mi"
            }
          }
        }
      }
    }
  }
}
