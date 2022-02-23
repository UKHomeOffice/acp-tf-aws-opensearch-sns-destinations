locals {
  subscriptionList = flatten([
    for team, emailList in var.destination_map : [
      for email in emailList : {
        team  = team
        email = email
      }
    ]
  ])
}