# frozen_string_literal: true

require_relative 'driver_config'

DRIVER = DriverConfig.new.setup_driver

Before do
  @driver = DRIVER
end

After do |scenario|
  if scenario.failed?
    encoded_img = DRIVER.screenshot_as(:base64)
    attach(encoded_img, 'image/png;base64')
  end
end
