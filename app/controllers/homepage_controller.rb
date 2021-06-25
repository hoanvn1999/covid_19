class HomepageController < ApplicationController
  def index
    response = Faraday.get("https://covid-api.mmediagroup.fr/v1/history?status=Confirmed")
    @confirmed = 0
    JSON.parse(response.env.response_body).each do |confirm|
      @confirmed += confirm.second["All"]["dates"][lastday]
    end
    
    response = Faraday.get("https://covid-api.mmediagroup.fr/v1/history?status=Recovered")
    @recovered = 0
    JSON.parse(response.env.response_body).each do |recover|
      @recovered += recover.second["All"]["dates"][lastday]
    end
    
    response = Faraday.get("https://covid-api.mmediagroup.fr/v1/history?status=Deaths")
    @death = 0
    JSON.parse(response.env.response_body).each do |die|
      @death += die.second["All"]["dates"][lastday]
    end
  end
end
