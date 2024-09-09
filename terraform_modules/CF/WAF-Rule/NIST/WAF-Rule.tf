  rules {
    action       = "js_challenge" #action type
    description  = "rule name" #add rule name
    enabled      = true
    expression   = "(not http.request.uri.path contains \"/cdn-cgi/\" and not http.request.uri.path contains \"/product-price/\" and not ip.geoip.country in {\"KW\" \"OM\" \"SA\" \"AE\" \"QA\"})"

    ratelimit {
      characteristics     = ["add characteristics"] #add characteristics
      counting_expression = "add expression" #add rule expression
      period              = 600
      requests_per_period = 100
    }
  }