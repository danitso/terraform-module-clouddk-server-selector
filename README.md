# Server Selector for Cloud.dk
Terraform Module for selecting a Cloud.dk server package based on hardware requirements.

# Requirements
- [Terraform](https://www.terraform.io/downloads.html) 0.12+

# Input Variables

## server_memory
The minimum amount of memory (in megabytes).

## server_processors
The minimum number of processors (cores).

# Output Variables

## server_type
The package id.
