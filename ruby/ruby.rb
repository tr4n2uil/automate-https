@repeat = 50

# http example

require 'rubygems'
require 'selenium-webdriver'

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
caps["browserstack.debug"] = "true"
caps["name"] = "http"
caps["build"] = "Ruby https vs http"

driver = Selenium::WebDriver.for(:remote,
  :url => "http://vibhajrajan1:isx1GLKoDPyxvJwMZBso@hub.browserstack.com/wd/hub",
  :desired_capabilities => caps)
driver.navigate.to "http://www.google.com"
element = driver.find_element(:name, 'q')
element.send_keys "BrowserStack"
element.submit
@repeat.times do
  puts driver.title
end
driver.quit

# https example
require './fast_selenium'

caps = Selenium::WebDriver::Remote::Capabilities.new
caps["browserstack.debug"] = "true"
caps["name"] = "https"
caps["build"] = "Ruby https vs http"

driver = Selenium::WebDriver.for(:remote,
  :url => "https://vibhajrajan1:isx1GLKoDPyxvJwMZBso@hub.browserstack.com/wd/hub",
  :desired_capabilities => caps)
driver.navigate.to "http://www.google.com"
element = driver.find_element(:name, 'q')
element.send_keys "BrowserStack"
element.submit
@repeat.times do
  puts driver.title
end
driver.quit

