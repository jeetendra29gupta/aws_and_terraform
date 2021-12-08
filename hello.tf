provider "local" {
  version = "2.1.0"
}
resource "local_file" "hello" {
  content = "Hello, Terraform \n"
  filename = "hello.txt"
}
