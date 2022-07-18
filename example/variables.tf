# variable "confirm_workspace" {
#   description = "To make sure you are working on current workspace, enter the workspace name"
#   validation {
#     condition = contains(["example"], var.confirm_workspace)
#     error_message = "Invalid workspace name."
#   }
# }

variable "config_dir" {
  default = "./config"
}