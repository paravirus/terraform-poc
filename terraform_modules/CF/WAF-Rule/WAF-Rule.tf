  rules {
    action = "block"
    action_parameters {
      response {
        content      = "{\n  \"status\": 400,\n  \"success\": false,\n  \"data\": {\n    \"message\": \"This API is deprecated.\",\n    \"code\": 400\n  }\n}"
        content_type = "application/json"
        status_code  = 400
      }
    }
    description  = "Rule Name" #add rule name
    enabled      = true
    expression   = "add expression" #add rule expression here
  }