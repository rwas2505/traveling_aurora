require 'http'

response = HTTP.get("https://aurora-ordering.tesla.com/api/v1/installations/913758/geometry")

p response.parse[0]["site"]