# Script de Definição de Variáveis

variable "name_bucket" {
  type        = string
  description = "Nome do bucket"
}

variable "versioning_bucket" {
  type        = string
  description = "Define se o versionamento do bucket estará habilitado"
}

variable "app_bucket" {
  type        = string
  description = "Pasta de onde o script python com o app sera obtido"
  default     = "./app"
}

variable "files_bash" {
  type        = string
  description = "Pasta de onde os scripts bash serão obtidos"
  default     = "./scripts"
}
