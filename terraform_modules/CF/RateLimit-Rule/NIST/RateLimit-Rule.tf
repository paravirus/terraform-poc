  rules {
    action       = "js_challenge"
    description  = "[D] 100r/10m - ASN (without GCC) "
    enabled      = true
    expression   = "(not http.request.uri.path contains \"/cdn-cgi/\" and not http.request.uri.path contains \"/product-price/\" and not ip.geoip.country in {\"KW\" \"OM\" \"SA\" \"AE\" \"QA\"})"
    last_updated = "2024-05-16T10:52:44.771031Z"
    ratelimit {
      characteristics     = ["ip.geoip.asnum", "http.host", "http.request.headers[\"host\"]", "http.request.uri.path", "cf.colo.id"]
      counting_expression = "(not http.host in {\"assets.salla.cloud\"})"
      period              = 600
      requests_per_period = 100
    }
  }