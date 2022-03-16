# frozen_string_literal: true

require_relative 'base_page'
require 'appium_lib'

# data page object
class DataPage < BasePage
  ANDROID_DATA_ELE = {
    bar_text: "//*[@resource-id='com.dyson.recruitment.test:id/action_bar']/android.widget.TextView",
    data_title: "//*[@resource-id='com.dyson.recruitment.test:id/fetch_data_title']",
    data_desc: "//*[@resource-id='com.dyson.recruitment.test:id/fetch_data_description']",
    view_result_btn: "//*[@resource-id='com.dyson.recruitment.test:id/fetch_data_primary_button']"
  }.freeze

  IOS_DATA_ELE = {
    bar_text: '//XCUIElementTypeNavigationBar/XCUIElementTypeStaticText',
    data_title: '//XCUIElementTypeStaticText[@name="view_results_title_label"]',
    data_desc: '//XCUIElementTypeStaticText[@name="view_results_body_label"]',
    view_result_btn: '//XCUIElementTypeStaticText[@name="View Results"]'
  }.freeze

  DATA_TEXT = {
    bar_text: 'Data Collection',
    data_title: 'Data collected',
    data_desc: 'The weather data has been successfully collected'
  }.freeze

  def initialize(driver)
    super
    retrieve_element(ANDROID_DATA_ELE, IOS_DATA_ELE)
    verify_page_text
  end

  def click_view_result
    find_by_xpath(@element[:view_result_btn]).click
  end

  private

  def verify_page_text
    raise 'bar text verify fail' unless find_by_xpath(@element[:bar_text]).text == DATA_TEXT[:bar_text]
    raise 'title verify fail' unless find_by_xpath(@element[:data_title]).text == DATA_TEXT[:data_title]
    # TODO: iOS is expected to be failed, collected should be lower case.

    raise 'desc verify fail' unless find_by_xpath(@element[:data_desc]).text == DATA_TEXT[:data_desc]
    # TODO: Android is expected to be failed, bar text is wrong and extra dot found for desc.
    # TODO: Pending to check expected button text "View Results" or "VIEW RESULTS"
  end
end
