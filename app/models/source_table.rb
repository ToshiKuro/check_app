class SourceTable

  # require 'selenium-webdriver'

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(timeout: 10)
    @id   = Rails.application.config.source.id
    @pass = Rails.application.config.source.pass
  end

  def get_table

    # siteを開く
    @driver.navigate.to('http://182.248.151.3/welcome.do')

    id = @driver.find_element(:xpath, '/html/body/form/div/table[2]/tbody/tr[1]/td[2]/input')
    pass = @driver.find_element(:xpath, '/html/body/form/div/table[2]/tbody/tr[2]/td[2]/input')

    id.send_keys(@id)
    pass.send_keys(@pass)

    @driver.find_element(:xpath, '/html/body/form/div/table[2]/tbody/tr[4]/td/input[1]').click 
    @wait.until { @driver.find_element(id: 'left_MNU02') }

    @driver.navigate.to('http://182.248.151.3/LoadQuery/loadQuery.do?method=defaultPage')
    @wait.until { @driver.find_element(id: 'search') }

    @driver.find_element(:xpath, '//*[@id="search"]').click
    @wait.until { @driver.find_element(id: 'flexTable') }

    doc = Nokogiri::HTML(@driver.page_source)
    @driver.quit

    doc.xpath('//div[@class="flexigrid"]').inner_html

  end

end