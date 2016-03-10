using System;
using OpenQA.Selenium;
using OpenQA.Selenium.Remote;

namespace SeleniumTest
{
  class BrowserStackTests
  {
    static void testHTTP()
    {
      IWebDriver driver;
      DesiredCapabilities capability = DesiredCapabilities.Firefox();
      capability.SetCapability("browserstack.user", BROWSERSTACK_USERNAME);
      capability.SetCapability("browserstack.key", BROWSERSTACK_ACCESS_KEY);
      capability.SetCapability("build", "CSharp HTTP vs HTTPS");
      capability.SetCapability("name", "HTTP");

      driver = new RemoteWebDriver(
        new Uri("http://hub.browserstack.com/wd/hub/"), capability
      );
      driver.Navigate().GoToUrl("http://www.google.com");
      Console.WriteLine(driver.Title);

      IWebElement query = driver.FindElement(By.Name("q"));
      query.SendKeys("Browserstack");
      query.Submit();
      for (int iter = 0; iter < 50; iter++)
      {
        Console.WriteLine(driver.Title);
      }

      driver.Quit();
    }
    static void testHTTPS()
    {
      IWebDriver driver;
      DesiredCapabilities capability = DesiredCapabilities.Firefox();
      capability.SetCapability("browserstack.user", BROWSERSTACK_USERNAME);
      capability.SetCapability("browserstack.key", BROWSERSTACK_ACCESS_KEY);
      capability.SetCapability("build", "CSharp HTTP vs HTTPS");
      capability.SetCapability("name", "HTTPS");

      driver = new RemoteWebDriver(
        new Uri("https://hub.browserstack.com/wd/hub/"), capability
      );
      driver.Navigate().GoToUrl("http://www.google.com");
      Console.WriteLine(driver.Title);

      IWebElement query = driver.FindElement(By.Name("q"));
      query.SendKeys("Browserstack");
      query.Submit();
      for (int iter = 0; iter < 50; iter++)
      {
        Console.WriteLine(driver.Title);
      }

      driver.Quit();
    }

    static void Main()
    {
      Console.WriteLine("Http Test");
      testHTTP();
      Console.WriteLine("Https Test");
      testHTTPS();
    }
  }
}