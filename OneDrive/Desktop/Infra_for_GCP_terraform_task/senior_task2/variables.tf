variable "project_id" {
  description = "This is project_id of the project where we are going to create the Cloud Run Service"

  type        = string
  validation {
    condition     = length(var.project_id) > 0
    error_message = "Project ID cannot be empty"
  }
}

variable "region1" {
  description = "Select the region where you want to  create the Cloud Run Service"
  type        = string
  default     = "asia-southeast1"
  validation {
    condition     = var.region1 != null
    error_message = "Region must be specified"
  }
}

variable "cloud_service_name" {
  description =  "The service name required here like Cloud Run Service"
  type        = string
  validation {
    condition     = length(var.cloud_service_name) > 0
    error_message = "Service name cannot be empty"
  }
}

variable "image" {
  description = "The container image to deploy"
  type        = string
  validation {
    condition     = var.image != null
    error_message = "Image cannot be null"
  }
}

variable "deploy_vpc_name" {
  description = "The vpc name"
  type        = string
  validation {
    condition     = length(var.deploy_vpc_name) > 0
    error_message = "VPC name cannot be empty"
  }
}

variable "image_tag" {
  description = "The container image tag"
  type        = string
  validation {
    condition     = var.image_tag != null
    error_message = "image tag must be specified"
  }
}

variable "artifact_repository_name" {
  description = "Write the repository name using for project"
  type        = string
  validation {
    condition     = var.repository_name != null
    error_message = "repository name must be specified"
  }
}

variable "subnets" {
  description = "Map of subnet configurations."
  type = map(object({
    name       = string
    cidr_block = string
  }))
  validation {
    condition     = can(keys(var.subnets))
    error_message = "Subnets must be provided as a map"
  }
}