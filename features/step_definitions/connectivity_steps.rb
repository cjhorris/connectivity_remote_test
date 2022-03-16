# frozen_string_literal: true

require_relative '../../page_object/connection_page'
require_relative '../../page_object/data_page'
require_relative '../../page_object/weather_page'



Given('I have an internet connection') do
  connection_page = ConnectionPage.new(@driver)
  connection_page.click_fetch_data
end

When('I have successfully downloaded the weather data') do
  data_page = DataPage.new(@driver)
  data_page.click_view_result
end

Then('I can see the weather and temperature for today') do
  weather_page = WeatherPage.new(@driver)
  weather_page.verify_weather
  weather_page.verify_temp
  weather_page.click_done_btn
end
