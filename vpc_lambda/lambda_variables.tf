# MASTER INSTANCE COUNT
variable "MASTER_INSTANCE_COUNT" {
  description = "Count of Master instances"
  type = number
  default = "1"
}

# MASTER VOLUME SIZE
variable "MASTER_VOLUME_SIZE" {
  description = "Size of Master instances"
  type = number
  default = "8"
}

# MASTER INSTANCE TYPE
variable "MASTER_INSTANCE_TYPE" {
  description = "Instance type of Master instances"
  type = string
  default = "t3.medium"
}

# SLAVE INSTANCE COUNT
variable "SLAVE_INSTANCE_COUNT" {
  description = "Count of Slave Instances"
  type = number
}

# SLAVE VOLUME SIZE
variable "SLAVE_VOLUME_SIZE" {
  description = "Size of Slave instances"
  type = number
}

