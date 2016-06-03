require 'watir-webdriver'


Before do |scenario|
  Data_Access::load
  @scenario_session = Scenario_Session.new
  @browser = Utilities.set_browser(scenario.name)
  Utilities.maximize_browser_window(@browser)
end

After do |scenario|
  begin
    if scenario.failed?
      take_screenshot(scenario.name)
    end
  rescue => error
    puts error.to_s
    @browser.close
  ensure
    @browser.close
  end
end

def take_screenshot(scenario_name)
  # filename = "report/screenshots/error-#{scenario_name.gsub(' ', '_').gsub(',', '_')}-#{@scenario_session.start_date_time}.png"
  # @browser.screenshot.save(filename)
  # embed(File.expand_path("#{filename}"), 'image/png', 'Scenario_Failed_Screenshot')
  # attach_file("error-#{scenario_name.gsub(' ', '_').gsub(',', '_')}-#{@scenario_session.start_date_time}",File.expand_path("#{filename}").downcase)
end