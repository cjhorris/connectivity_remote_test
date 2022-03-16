# frozen_string_literal: true

# BasePage object
class BasePage
  TIMEOUT = 10
  WAIT = Selenium::WebDriver::Wait.new(timeout: TIMEOUT)

  def initialize(driver)
    @driver = driver
    @logger = Logger.new($stdout)
  end

  def retrieve_element(android_element, ios_element)
    @element = case ENV['DEVICE']
               when 'iOS'
                 ios_element
               when 'Android'
                 android_element
               else
                 raise "DEVICE #{ENV['DEVICE']} not supported"
               end
  end

  def find_by_xpath(xpath)
    WAIT.until { @driver.find_element(:xpath, xpath).displayed? }
    @driver.find_element(:xpath, xpath)
  end
end
