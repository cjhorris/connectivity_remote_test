# frozen_string_literal: true
#
# require 'selenium-webdriver'
require 'appium_lib'

# Initialize the driver setup
class DriverConfig
  # def initialize
  #   @env = ENV['ENVIRONMENT']
  #   @application = ENV['APPLICATION']
  #   @platform = ENV['PLATFORM']
  # end

  def setup_driver
    @driver = setup_appium_driver
    @driver.manage.timeouts.implicit_wait = 10
    @driver
  end

  private

  def setup_appium_driver
    device_config = YAML.load_file('config/devices.yml')[ENV['DEVICE']]
    appium_opts = {}
    appium_opts[:caps] = device_config
    appium_opts[:appium_lib] = { port: device_config['appiumPort'], wait: 180 }
    Appium::Driver.new(appium_opts, true).start_driver
  end
end
