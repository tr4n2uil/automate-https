var webdriver = require('selenium-webdriver');
require('./fast-selenium');

var repeat = process.env.REPEAT || 50;

// Input capabilities
var capabilities = {
  'browserName' : 'Chrome', 
  'browserstack.user' : process.env.BROWSERSTACK_USER,
  'browserstack.key' : process.env.BROWSERSTACK_ACCESS_KEY,
  'build': 'Nodejs https vs http',
  'name': 'https'
}

var driver = new webdriver.Builder().
  usingServer('https://hub.browserstack.com/wd/hub').
  withCapabilities(capabilities).
  build();

driver.get('http://www.google.com');

for(var i=0; i<repeat; i++){
  driver.findElement(webdriver.By.name('q')).sendKeys('BrowserStack');
}

driver.findElement(webdriver.By.name('btnG')).click();
driver.getTitle().then(function(title) {
  console.log(title);
});

driver.quit();
