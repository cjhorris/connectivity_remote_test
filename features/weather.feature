Feature: Weather
  In order to improve my hike today
  As a keen hiker
  I want to be able to view today's weather

  Scenario: Get the high level weather forecast
    Given I have an internet connection
    When I have successfully downloaded the weather data
    Then I can see the weather and temperature for today


# TODO: Scenario: Verify page landing to verify page back behavior, currently Android is wrong
# TODO: Scenario: Verify behavior after click Done, currently iOS will show pops up but Android is closing apk
# TODO: To check the iOS button without navigation bar

