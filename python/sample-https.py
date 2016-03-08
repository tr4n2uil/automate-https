import os
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import fast_selenium

repeat = os.environ['REPEAT'] if 'REPEAT' in os.environ else 50

desired_cap = { 
  'browser': 'Chrome',
  'build': 'Python https vs http', 
  'name': 'https'
}

driver = webdriver.Remote(
  command_executor='https://'+os.environ['BROWSERSTACK_USER']+':'+os.environ['BROWSERSTACK_ACCESS_KEY']+'@hub.browserstack.com/wd/hub',
  desired_capabilities=desired_cap)

driver.get("http://www.google.com")
if not "Google" in driver.title:
  raise Exception("Unable to load google page!")
elem = driver.find_element_by_name("q")
elem.send_keys("BrowerStack")
elem.submit()
for n in range(0, repeat):
  print driver.title
driver.quit()
