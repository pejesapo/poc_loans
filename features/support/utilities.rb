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
    caps = Selenium::WebDriver::Remote::Capabilities.new
    caps['platform'] = "Windows 8.1"
    caps['browserName'] = "internet explorer"
    caps['version'] = "11"
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
end