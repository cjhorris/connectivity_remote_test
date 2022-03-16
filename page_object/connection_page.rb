# frozen_string_literal: true

require_relative 'base_page'
require 'appium_lib'

# connection page object
class ConnectionPage < BasePage
  ANDROID_CONN_ELE = {
    bar_text: "//*[@resource-id='com.dyson.recruitment.test:id/action_bar']/android.widget.TextView",
    conn_tittle: "//*[@resource-id='com.dyson.recruitment.test:id/connection_display_title']",
    conn_desc: "//*[@resource-id='com.dyson.recruitment.test:id/connection_display_description']",
    fetch_data_btn: "//*[@resource-id='com.dyson.recruitment.test:id/connection_display_primary_button']"
  }.freeze

  IOS_CONN_ELE = {
    bar_text: '//XCUIElementTypeNavigationBar/XCUIElementTypeStaticText',
    conn_tittle: '//XCUIElementTypeStaticText[@name="fetch_data_title_label"]',
    conn_desc: '//XCUIElementTypeStaticText[@name="fetch_data_body_label"]',
    fetch_data_btn: '//XCUIElementTypeStaticText[@name="Fetch Data"]'
  }.freeze

  CONN_TEXT = {
    bar_text: 'Connectivity',
    conn_tittle: 'Connected',
    conn_desc: 'You are connected to the internet'
  }.freeze

  def initialize(driver)
    super
    retrieve_element(ANDROID_CONN_ELE, IOS_CONN_ELE)
    verify_page_text
  end

  def click_fetch_data
    find_by_xpath(@element[:fetch_data_btn]).click
  end

  private

  def verify_page_text
    raise 'bar text verify fail' unless find_by_xpath(@element[:bar_text]).text == CONN_TEXT[:bar_text]
    raise 'title verify fail' unless find_by_xpath(@element[:conn_tittle]).text == CONN_TEXT[:conn_tittle]
    raise 'desc verify fail' unless find_by_xpath(@element[:conn_desc]).text == CONN_TEXT[:conn_desc]

    # TODO: Android is expected to be failed, bar text is wrong and extra dot found for desc
    # TODO: Pending to check expected button text "Fetch Data" or "FETCH DATA"
  end
end
