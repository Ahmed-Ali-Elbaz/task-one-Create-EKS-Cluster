# Create IAM Role

resource "aws_iam_role" "eks_master_role" {
  name = "${local.name}-eks-master-role"

  assume_role_policy = jsonencode({
    Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
            Service = "eks.amazonaws.com"
        }

    }]

    Version = "2012-10-17"
  })

}


# associate IAM Policy to IAM Role
    /*
      This is an AWS managed policy that grants the necessary permissions for EKS
      to create and manage other AWS resources, such as Amazon Elastic Load Balancers (ELBs) and Auto Scaling groups.
    */

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_master_role.name
}


    /*
      VPC resource controller to automatically create and manage the VPC resources that are required for the cluster.
    */
resource "aws_iam_role_policy_attachment" "eks-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_master_role.name
}


