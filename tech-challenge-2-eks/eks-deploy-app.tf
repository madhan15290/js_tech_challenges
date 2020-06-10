data "helm_repository" "js_artifacts" {
  name = "js_artifacts"
  url  = "https://842220500251.dkr.ecr.us-east-1.amazonaws.com"
}

resource "helm_release" "jssimpleapp" {
  name  = "jssimpleapp"
  chart = "jssimpleapp"

  values = [
    "${file("values.yaml")}"
  ]

  set {
    name  = "cluster.enabled"
    value = "true"
  }


  timeout = 1200
}