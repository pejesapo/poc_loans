require 'rest_client'
require 'yaml'

module Utilities

  def self.set_browser(name)
    case ENV['TARGET']
      when 'local'
        self.local_capabilities
      when 'sauce_labs'
        self.sauce_capabilities(name)
      else
        self.local_capabilities

    end
  end

  def self.sauce_capabilities(name)
    caps = Selenium::WebDriver::Remote::Capabilities.iphone
    caps['platform'] = "OS X 10.10"
    #caps['browserName'] = "chrome"
    caps['version'] = "9.2"
    caps['deviceName'] = "iPad 2"
    caps['deviceOrientation'] = 'landscape'
    caps['name'] = name
    return Watir::Browser.new(:remote, url: self.sauce_server_url, desired_capabilities: caps)
  end

  def self.local_capabilities
    return Watir::Browser.new :chrome
  end
  def self.sauce_auth_details
    "#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}"
  end

  def self.sauce_server_url
    "http://#{sauce_auth_details}@ondemand.saucelabs.com:80/wd/hub"
  end

  def self.maximize_browser_window(browser)
    screen_width = browser.execute_script('return screen.width;')
    screen_height = browser.execute_script('return screen.height;')
    browser.driver.manage.window.resize_to(screen_width, screen_height)
    browser.driver.manage.window.move_to(0, 0)
  end

  def self.sauce_rest_jobs_url
    "https://#{sauce_auth_details}@saucelabs.com/rest/v1/#{ENV['SAUCE_USERNAME']}/jobs"
  end

  # Because WebDriver doesn't have the concept of test failure, use the Sauce
  # Labs REST API to record job success or failure
  def self.sauce_update_job_success(appium, success)
    job_id = appium.driver.send(:bridge).session_id
    RestClient.put "#{sauce_rest_jobs_url}/#{job_id}", {'passed' => success}.to_json, :content_type => :json
  end
end