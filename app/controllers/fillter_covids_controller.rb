class FillterCovidsController < ApplicationController
  def index
    if params[:country].present?
      response = Faraday.get("https://covid-api.mmediagroup.fr/v1/history?status=Confirmed&country=#{params[:country]}")
      @confirmed = JSON.parse(response.env.response_body)["All"]["dates"][lastday]
      
      response = Faraday.get("https://covid-api.mmediagroup.fr/v1/history?status=Recovered&country=#{params[:country]}")
      @recovered = JSON.parse(response.env.response_body)["All"]["dates"][lastday]
      
      response = Faraday.get("https://covid-api.mmediagroup.fr/v1/history?status=Deaths&country=#{params[:country]}")
      @death = JSON.parse(response.env.response_body)["All"]["dates"][lastday]
    else
      @confirmed = 0
      @recovered = 0
      @death = 0
    end
  end
end
