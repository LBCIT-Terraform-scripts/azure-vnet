# Random String Resource
resource "random_string" "my_random" {
  special = false
  length  = 5
  upper   = false
  number  = false
}


# testing out the resource trigger