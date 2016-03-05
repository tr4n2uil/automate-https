require 'rubygems'
require 'selenium-webdriver'
require './fast_selenium'

@repeat = ENV['REPEAT'] || 50

caps = Selenium::WebDriver::Remote::Capabilities.new
caps["browserstack.debug"] = "true"
caps["name"] = "https"
caps["build"] = "Ruby https vs http"

driver = Selenium::WebDriver.for(:remote,
  :url => "https://#{ENV["BROWSERSTACK_USER"]}:#{ENV["BROWSERSTACK_ACCESS_KEY"]}@hub.browserstack.com/wd/hub",
  :desired_capabilities => caps)
driver.navigate.to "http://www.google.com"
element = driver.find_element(:name, 'q')
element.send_keys "BrowserStack"
element.submit
@repeat.times do
  puts driver.title
end
driver.quit

