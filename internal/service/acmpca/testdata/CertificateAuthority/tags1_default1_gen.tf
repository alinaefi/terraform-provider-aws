# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  default_tags {
    tags = {
      (var.providerTagKey1) = var.providerTagValue1
    }
  }
}

resource "aws_acmpca_certificate_authority" "test" {
  permanent_deletion_time_in_days = 7
  usage_mode                      = "SHORT_LIVED_CERTIFICATE"

  certificate_authority_configuration {
    key_algorithm     = "RSA_4096"
    signing_algorithm = "SHA512WITHRSA"

    subject {
      common_name = var.rName
    }
  }

  tags = {
    (var.tagKey1) = var.tagValue1
  }
}


variable "rName" {
  type     = string
  nullable = false
}

variable "tagKey1" {
  type     = string
  nullable = false
}

variable "tagValue1" {
  type     = string
  nullable = false
}


variable "providerTagKey1" {
  type     = string
  nullable = false
}

variable "providerTagValue1" {
  type     = string
  nullable = false
}
