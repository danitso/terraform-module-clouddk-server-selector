# Server Selector
Terraform Module for selecting a Cloud.dk server package based on hardware requirements.

## Requirements
- [Terraform](https://www.terraform.io/downloads.html) 0.12+

## Getting started

1. Create a new file called `server_selector.tf` with the following contents:

    ```hcl
    module "server_selector" {
        source = "github.com/danitso/terraform-module-clouddk-server-selector"

        server_memory     = 4096
        server_processors = 2
    }
    ```

1. Initialize your workspace

    ```bash
    docker run -v .:/workspace -it --rm danitso/terraform:0.12 init
    ```

    or using `cmd.exe`:

    ```batchfile
    docker run -v %CD%:/workspace -it --rm danitso/terraform:0.12 init
    ```

1. Provision the resources

    ```bash
    docker run -v .:/workspace -it --rm danitso/terraform:0.12 apply -auto-approve
    ```

    or using `cmd.exe`:

    ```batchfile
    docker run -v %CD%:/workspace -it --rm danitso/terraform:0.12 apply -auto-approve
    ```

You can modify the configuration by changing the [Input Variables](#input-variables) on the `module` block.

## Input Variables

### server_memory
The minimum amount of memory (in megabytes).

### server_processors
The minimum number of processors (cores).

## Output Variables

### server_type
The package id.
