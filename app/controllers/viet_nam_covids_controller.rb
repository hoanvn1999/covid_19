class VietNamCovidsController < ApplicationController
  def index
    response = Faraday.get("https://covid-api.mmediagroup.fr/v1/history?status=Confirmed&country=Vietnam")
    @confirmed = JSON.parse(response.env.response_body)["All"]["dates"][lastday]
    
    response = Faraday.get("https://covid-api.mmediagroup.fr/v1/history?status=Recovered&country=Vietnam")
    @recovered = JSON.parse(response.env.response_body)["All"]["dates"][lastday]
    
    response = Faraday.get("https://covid-api.mmediagroup.fr/v1/history?status=Deaths&country=Vietnam")
    @death = JSON.parse(response.env.response_body)["All"]["dates"][lastday]

    response = Faraday.get("https://covid-api.mmediagroup.fr/v1/vaccines?country=Vietnam")
    @administered = JSON.parse(response.env.response_body)["All"]["administered"]

    response = Faraday.get("https://covid-api.mmediagroup.fr/v1/vaccines?country=Vietnam")
    @people_vaccinated = JSON.parse(response.env.response_body)["All"]["people_vaccinated"]

    response = Faraday.get("https://covid-api.mmediagroup.fr/v1/vaccines?country=Vietnam")
    @people_partially_vaccinated = JSON.parse(response.env.response_body)["All"]["people_partially_vaccinated"]
  end
end
