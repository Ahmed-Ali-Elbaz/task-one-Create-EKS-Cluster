# Resource: Helm Release 
resource "helm_release" "flask_app" {
  name       = "flask-app"

  repository = "https://Ahmed-Ali-Elbaz.github.io/task-one-Create-EKS-Cluster/helm-charts"
  chart      = "flask-app"

  namespace = "default"     

#   set {
#     name = "image.repository"
#     value = ""
#   }       


    
}


 
  
