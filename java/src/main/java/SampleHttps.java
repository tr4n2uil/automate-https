import org.openqa.selenium.By;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.net.URL;

public class SampleHttps {
  public static final int REPEAT = Boolean.valueOf(System.getenv("REPEAT")) ? Integer.valueOf(System.getenv("REPEAT")) : 50;

  public static final String USERNAME = System.getenv("BROWSERSTACK_USER");
  public static final String AUTOMATE_KEY = System.getenv("BROWSERSTACK_ACCESS_KEY");
  public static final String URL = "https://" + USERNAME + ":" + AUTOMATE_KEY + "@hub.browserstack.com/wd/hub";

  public static void main(String[] args) throws Exception {
    
    DesiredCapabilities caps = new DesiredCapabilities();
    caps.setCapability("browserstack.debug", "true");
    caps.setCapability("build", "Java https vs http");
    caps.setCapability("name", "https");

    WebDriver driver = new RemoteWebDriver(new URL(URL), caps);
    driver.get("http://www.google.com");
    WebElement element = driver.findElement(By.name("q"));

    element.sendKeys("BrowserStack");
    element.submit();

    int i;
    for(i=0; i < REPEAT; i++)
      System.out.println(driver.getTitle());

    driver.quit();

  }
}
