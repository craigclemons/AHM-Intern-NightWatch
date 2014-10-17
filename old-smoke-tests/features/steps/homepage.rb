require 'rubygems'
require 'selenium-webdriver'
require 'rspec'

When /^I visit the "(\S+)" page$/ do |address|
  $browser.get("http://#{address}")
end

When /^I visit the "(\S+)" secure page$/ do |address|
  $browser.get("https://#{address}")
end

When /^I click the "(.*)" link$/ do |link_text|
  $wait.until {
    $browser.find_element(:link, link_text)
  }
  $browser.find_element(:link, link_text).click
end

When /^I log in with "(.*?)" and "(.*?)"$/ do |username, password|
  $browser.find_element(:name, "data[Member][email]").send_keys(username)
  $browser.find_element(:name, "data[Member][password]").send_keys(password)
  form = $browser.find_element(:id, "MemberLoginForm")
  form.find_element(:xpath, "//button[@type='submit']").click
end

When /^I click the checkbox for text events$/ do
  $wait.until {
    $browser.find_element(:id, 'EventTypeText')
  }
  sleep(1)
  $browser.find_element(:id, 'EventTypeText').click
end

When /^I select "(.*?)" in the "(.*?)" dropdown$/ do |option_text, select_id|
  $wait.until {
    $browser.find_element(:id, select_id)
  }
  element = $browser.find_element(:id, select_id)
  select  = Selenium::WebDriver::Support::Select.new(element)
  select.select_by(:text, option_text)
end

When /^I wait for (\d+) second/ do |seconds|
  sleep(seconds.to_i)
end

When /^I accept the "(.*?)" alert$/ do |alert_text|
  a = $browser.switch_to.alert
  if a.text =~ /#{Regexp.quote(alert_text)}/
      a.accept
  else
      a.dismiss
  end
end

Then /^I should see "(.*?)"$/ do |text|
  $wait.until {
    /#{text}/.match($browser.page_source)
  }
  $browser.page_source.should =~ /#{text}/m
end

Then /^I should regexp see "(.*)"$/ do |text|
  $wait.until {
    /#{text}/.match($browser.page_source)
  }
  $browser.page_source.should =~ /#{text}/m
end

Then /^the current url should contain "(.*?)"$/ do |url_text|
    $browser.current_url.should =~ /#{Regexp.quote(url_text)}/
end

Then /^I should see at least (\d+) job listing/ do |min_jobs|
  $wait.until {
    /<\/\w+:html>/.match($browser.page_source)
  }
  $browser.find_elements(:xpath => "//tr", :class => "job-short").count.should be >= min_jobs.to_i
end

Then /^I should see at least (\d+) event/ do |min_events|
  $wait.until {
    /<\/\w+:html>/.match($browser.page_source)
  }
  $browser.find_elements(:xpath => "//td", :class => "event-details").count.should be >= min_events.to_i
end

Then /^I should see exactly (\d+) event/ do |num_events|
  $wait.until {
    /<\/\w+:html>/.match($browser.page_source)
  }
  # $browser.find_elements(:xpath => "//td", :class => "event-details").count.should == num_events.to_i
  $browser.find_elements(:css => 'td.event-details').count.should == num_events.to_i
end

When /^I create a new account "(.*?)"/ do |account_name|
  $wait.until {
    /<\/\w+:html>/.match($browser.page_source)
  }
  num = rand(1000000).to_s
  info = {
    'registerFirstName' => account_name + num,
    'registerLastName'  => account_name + num,
    'registerEmail'     => account_name + num + "@audiologyholdings.com",
    'registerPassword'  => 'xxxxxxxxxxxx',
    'registerPasswordConfirm' => 'xxxxxxxxxxxx',
    'registerZip'       => '12345',
    'registerPhone'     => '888-555-1212',
  }
  info.each do |field, value|
    $browser.find_element(:id, field).send_keys(value)
  end
  form = $browser.find_element(:id, "MemberRegisterForm")
  form.find_element(:xpath, "//input[@type='submit']").click
end

When /^I autofill "(.*?)"/ do |text|
  $browser.find_element(:name, 'AutoFillFormAhmName').send_keys(text)
  $browser.find_element(:name, 'AutoFillFormAhmRm').send_keys('1')
  $browser.find_element(:link, "AutoFillForm").click
end

When /^I submit the "(.*?)" form/ do |form_id|
  form = $browser.find_element(:id, form_id)
  form.find_element(:xpath, "//input[@type='submit']").click
end

When /^I choose Alaska as a Member License State/ do
  select_id = "MemberStateLicense0State"
  option_text = "Alaska"

  $wait.until {
    $browser.find_element(:id, select_id)
  }
  element = $browser.find_element(:id, select_id)
  select  = Selenium::WebDriver::Support::Select.new(element)
  select.select_by(:text, option_text)
end

When /^I set the autofill cookie/ do
  $browser.execute_script('$.cookie("AutoFillFormAhm", 1);');
end
