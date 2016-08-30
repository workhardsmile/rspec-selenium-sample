module WebDriver
  class << self
    def launch_browser
      @driver = Selenium::WebDriver.for :firefox
      @driver.manage.timeouts.implicit_wait = 10
    end
    
    def quit_browser
      @driver.quit
    end
  end
end