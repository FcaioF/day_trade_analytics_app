# Projeto 2 - Deploy do Stack de Treinamento Distribuído de Machine Learning com PySpark no Amazon EMR
# Variáveis do S3

variable "name_bucket" {
  type        = string
  description = "Nome do bucket"
}

variable "app_bucket" {
  type        = string
  description = "Pasta de onde o script python com o app sera obtido"
}

variable "files_bash" {
  type        = string
  description = "Pasta de onde os scripts bash serão obtidos"
}