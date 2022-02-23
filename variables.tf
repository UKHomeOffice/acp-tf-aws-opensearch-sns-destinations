variable "destination_map" {
  type = map 
  description = "A map of lists detailing team and email addresses required for each internal monitoring destination for opensearch"
  default = {}
}