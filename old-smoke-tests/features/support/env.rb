require 'rubygems'
require 'selenium-webdriver'
require 'rspec'

$browser = Selenium::WebDriver.for(:firefox)
$wait = Selenium::WebDriver::Wait.new(:timeout => 40)
$browser.manage.window.resize_to(1024,768)
$browser.manage.delete_all_cookies

at_exit do
  $browser.quit
end
