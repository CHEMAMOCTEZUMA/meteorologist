require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    url = "https://api.forecast.io/forecast/3369840cf488b3c66ced3b93fd331d77/#{@lat},#{@lng}" 
 
    raw_data_f = open(url).read

    require 'json'

    parsed_data_f = JSON.parse(raw_data_f)

    @current_temperature = parsed_data_f["currently"]["temperature"]

    @current_summary = parsed_data_f["currently"]["summary"]

    @summary_of_next_sixty_minutes = parsed_data_f["minutely"]["summary"]

    @summary_of_next_several_hours = parsed_data_f["hourly"]["summary"]

    @summary_of_next_several_days = parsed_data_f["daily"]["summary"]

    render("coords_to_weather.html.erb")
  end
end
