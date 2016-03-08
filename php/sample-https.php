<?php

  require_once('vendor/autoload.php');

  $repeat = getenv("REPEAT") ? getenv("REPEAT") : 50;

  $web_driver = RemoteWebDriver::create(
    "https://".getenv("BROWSERSTACK_USER").":".getenv("BROWSERSTACK_ACCESS_KEY")."@hub.browserstack.com/wd/hub", 
    array(
      "browserName" => "chrome",
      "build" => "PHP https vs http",
      "name" => "https"
    )
  );

  $web_driver->get("http://google.com");

  $element = $web_driver->findElement(WebDriverBy::name("q"));
  if($element) {
      $element->sendKeys("Browserstack");
      $element->submit();
  }

  for($i = 0; $i < $repeat; $i++)
    print $web_driver->getTitle();

  $web_driver->quit();

?>
