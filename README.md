# Magic Wand VPN

The point of this project is to deploy a VPN connection on AWS to connect to the Magic Wand website from anywhere in the world.

This is a Terraspace project. It contains code to provision Cloud infrastructure built with [Terraform](https://www.terraform.io/) and the [Terraspace Framework](https://terraspace.cloud/).

## Deploy

To deploy all the infrastructure stacks:

    terraspace all up

To deploy individual stacks:

    terraspace up demo # where demo is app/stacks/demo

## Terrafile

To use more modules, add them to the [Terrafile](https://terraspace.cloud/docs/terrafile/).

## Add a new Stack

to add a new stack:

    terraspace new stack demo # where demo is app/stacks/demo

## Continuous integration / delivery

The project is automatically deployed via [GitHub Action](https://fr.github.com/features/actions).
The configuration of the CI workflow is available on **./.github/workflows/CI.yaml**.

## Security

The project is automatically tested on the continuous intégration via [tfsec](https://github.com/aquasecurity/tfsec).