require "selenium-webdriver"
require "rspec"
require "rspec/autorun"
#require "rspec/expectations"
include RSpec::Expectations         

describe "This is Demo Script" do
  
  before(:each) do
    #@driver = Selenium::WebDriver.for :firefox
    @driver = Selenium::WebDriver.for(
    :remote,
    url: 'http://localhost:4444/wd/hub',
    desired_capabilities: :firefox)
    @driver.manage.timeouts.implicit_wait = 10
    
    @driver.manage.timeouts.implicit_wait = 10
  end

  after(:each) do
    @driver.quit            
  end

  it "navigate to CNN" do
    
    @driver.navigate.to "http://www.cnn.com/"
    puts "CNN Title = #{@driver.title}"
    
    @driver.find_element(:link_text, 'World').click
    puts "CNN World Title = #{@driver.title}"
  
    begin  
      @driver.find_element(:id, "cancelButton").click    
      rescue Exception => e
        puts "Exception Message: #{e.message}"
      #if e.message =~ /Unable to locate element/
      if e.message =~ /We Are The Champions/
        puts "We Are Are The Champions"        
      elsif e.message =~ /Unable to locate element/
        puts "Cancel Button Not Found"
      else
        #raise "Cancel Button Found"
        fail "Cancel Button Found"
      end
    end
  end

  it "navigate to google" do
    
    @driver.get "https://www.google.com"
    puts "Google Title = #{@driver.title}"
    @driver.find_element(:id, "lst-ib").send_keys 'selenium webdriver ruby'
    @driver.find_element(:id, "sblsbb").click    
  
    begin  
      @driver.find_element(:id, "cancelButton").click    
      rescue Exception => e
        puts "Exception Message: #{e.message}"
      #if e.message =~ /Unable to locate element/
      if e.message =~ /We Are The Champions/
        puts "We Are Are The Champions"        
      elsif e.message =~ /Unable to locate element/
        puts "Cancel Button Not Found"
      else
        #raise "Cancel Button Found"
        fail "Cancel Button Found"
      end
    end        
  end           

  it "navigate to yahoo" do
    
    @driver.navigate.to "https://www.yahoo.com"
    puts "Yahoo Title = #{@driver.title}"
    
    #@driver.find_element(:link_text, 'News').click
    #puts "Yahoo Title = #{@driver.title}"
  
    begin  
      @driver.find_element(:id, "cancelButton").click    
      rescue Exception => e
        puts "Exception Message: #{e.message}"
      #if e.message =~ /Unable to locate element/
      if e.message =~ /We Are The Champions/
        puts "We Are Are The Champions"        
      elsif e.message =~ /Unable to locate element/
        puts "Cancel Button Not Found"
      else
        #raise "Cancel Button Found"
        fail "Cancel Button Found"
      end
    end
  end
    
  it "navigate to F1 Infellowship" do
    
    @driver.navigate.to "https://dc.qa.infellowship.com/userlogin/"
    puts "F1 Infellowship Title = #{@driver.title}"
    
    begin      
      @driver.find_element(:id, "username").send_keys 'felix.gaytan@activenetwork.com'
      @driver.find_element(:id, "password").send_keys 'FG.Admin12'
      @driver.find_element(:id, "btn_login").click    
    rescue Exception => e
        puts "Exception Message: #{e.message}"
      
    end
    
    @driver.find_element(:link_text, "Sign out").click
    
  end
  
end