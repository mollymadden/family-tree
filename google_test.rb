require 'google_search_results' 

params = {
    q: "1948 news",
    location: "Los Angeles, CA, California, United States",
    hl: "en",
    gl: "us",
    google_domain: "google.com",
    api_key: "secret_api_key"
}

client = GoogleSearchResults.new(params)
hash_results = client.get_hash