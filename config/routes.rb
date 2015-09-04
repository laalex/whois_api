Rails.application.routes.draw do
  root to: "api#show"

  post "/api/whois", to: "api#whois"
  post "/api/whois/raw", to: "api#raw"


end
