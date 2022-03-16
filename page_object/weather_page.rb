# frozen_string_literal: true

require_relative 'base_page'
require 'appium_lib'

# weather page object
class WeatherPage < BasePage
  ANDROID_WEATHER_ELE = {
    bar_text: "//*[@resource-id='com.dyson.recruitment.test:id/action_bar']/android.widget.TextView",
    weather_title: "//*[@resource-id='com.dyson.recruitment.test:id/weather_display_weather_title']",
    weather_value: "//*[@resource-id='com.dyson.recruitment.test:id/weather_display_weather_value']",
    temp_title: "//*[@resource-id='com.dyson.recruitment.test:id/weather_display_temperature_title']",
    temp_value: "//*[@resource-id='com.dyson.recruitment.test:id/weather_display_temperature_value']",
    done_btn: "//*[@resource-id='com.dyson.recruitment.test:id/weather_display_primary_button']"
  }.freeze

  IOS_WEATHER_ELE = {
    bar_text: '//XCUIElementTypeNavigationBar/XCUIElementTypeStaticText',
    weather_title: '//XCUIElementTypeStaticText[@name="weather_title_label"]',
    weather_value: '//XCUIElementTypeStaticText[@name="weather_description_label"]',
    temp_title: '//XCUIElementTypeStaticText[@name="temperature_title_label"]',
    temp_value: '(//XCUIElementTypeStaticText)[5]',
    # TODO: need to have proper id or name
    done_btn: '//XCUIElementTypeStaticText[@name="Done"]'
  }.freeze

  WEATHER_TEXT = {
    bar_text: 'Weather Data',
    weather_title: 'Weather',
    temp_title: 'Temperature'
  }.freeze

  def initialize(driver)
    super
    retrieve_element(ANDROID_WEATHER_ELE, IOS_WEATHER_ELE)
    verify_page_text
  end

  def verify_weather
    weather_ele = find_by_xpath(@element[:weather_value])
    raise 'weather is empty' if weather_ele.text == ''

    @logger.info("weather data is #{weather_ele.text}")
  end

  def verify_temp
    temp_text = find_by_xpath(@element[:temp_value]).text
    raise 'temperature is empty' if temp_text == ''
    raise 'temp format is wrong' unless temp_text.include? '°C'

    # TODO: Android is expected to be failed, the temperature format is wrong
    @logger.info("temperature data is #{temp_text}")
  end

  def click_done_btn
    find_by_xpath(@element[:done_btn]).click
  end

  private

  def verify_page_text
    raise 'bar text verify fail' unless find_by_xpath(@element[:bar_text]).text == WEATHER_TEXT[:bar_text]
    # TODO: Android is expected to be failed, bar text is wrong.
    raise 'title verify fail' unless find_by_xpath(@element[:weather_title]).text == WEATHER_TEXT[:weather_title]
    raise 'title verify fail' unless find_by_xpath(@element[:temp_title]).text == WEATHER_TEXT[:temp_title]
    # TODO: iOS is expected to be failed, collected should be lower case.

    # TODO: Pending to check expected button text "Done" or "DONE"
  end
end
