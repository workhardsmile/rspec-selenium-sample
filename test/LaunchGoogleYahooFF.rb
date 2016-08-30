require "selenium-webdriver"
require "rspec"
require "rspec/autorun"
include RSpec::Expectations         

describe "This is Demo Script" do
    
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    
    @driver.manage.timeouts.implicit_wait = 10
  end

  after(:each) do
    @driver.quit            
  end

  it "navigate to google" do
    
    @driver.get "https://www.google.com"
    puts "Google Title = #{@driver.title}"
    
  
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
        @driver.save_screenshot "./screenshots/#{Time.now.strftime("failshot__%d_%m_%Y__%H_%M_%S")}_Yahoo.png"      
        fail "Cancel Button Found"
      end
    end
  end
  

   describe "CNN" do
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
   end


  
end