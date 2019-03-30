class SourceTable

  ID     = Rails.application.credentials.id
  PASS   = Rails.application.credentials.pass

  p Rails.application.credentials.id

  class << self
    def get_table(select_date)

      options  = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      driver   = Selenium::WebDriver.for :chrome, options: options
      wait     = Selenium::WebDriver::Wait.new(timeout: 30)
      table    = []
      table_tr = []

      # siteを開く
      driver.navigate.to('http://182.248.151.3/welcome.do')

      id = driver.find_element(:xpath, '/html/body/form/div/table[2]/tbody/tr[1]/td[2]/input')
      pass = driver.find_element(:xpath, '/html/body/form/div/table[2]/tbody/tr[2]/td[2]/input')

      id.send_keys(ID)
      pass.send_keys(PASS)

      driver.find_element(:xpath, '/html/body/form/div/table[2]/tbody/tr[4]/td/input[1]').click 


      p driver.title
      p ID
      p pass
      # driver.save_screenshot(cache_file)

      wait.until { driver.find_element(id: 'left_MNU02') }

      p driver.title

      # Load Serch画面表示
      driver.navigate.to('http://182.248.151.3/LoadQuery/loadQuery.do?method=defaultPage')
      wait.until { driver.find_element(id: 'search') }

      p driver.title

      # 日付選択
      driver.execute_script("document.getElementById('queryDate').readOnly = false;")
      driver.find_element(:xpath, '//*[@id="queryDate"]').clear
      driver.find_element(:xpath, '//*[@id="queryDate"]').send_keys(select_date)

      # 国際線data取得
      driver.find_element(:xpath, '//*[@id="domInt"]/option[1]').click
      driver.find_element(:xpath, '//*[@id="search"]').click
      wait.until { driver.find_element(id: 'flexTable').displayed? }

      driver.save_screenshot("screenshot.png")

      p driver.title

      doc = Nokogiri::HTML(driver.page_source)
      doc.xpath('//*[@id="flexTable"]/tbody/tr').each do |tr|
        tr.css('td').each do |td|
          table_tr << td.text
        end
        table << table_tr
        table_tr = []
      end

      # 一度戻りtableをreset
      driver.navigate.back
      wait.until{ !driver.find_element(id: 'flexTable').displayed? }

      # 日付選択
      driver.execute_script("document.getElementById('queryDate').readOnly = false;")
      driver.find_element(:xpath, '//*[@id="queryDate"]').clear
      driver.find_element(:xpath, '//*[@id="queryDate"]').send_keys(select_date)

      # 国内線data取得
      n = 2
      driver.find_element(:xpath, "//*[@id=\"domInt\"]/option[#{n}]").click
      driver.find_element(:xpath, '//*[@id="search"]').click
      wait.until { driver.find_element(id: 'flexTable').displayed? }

      driver.save_screenshot("screenshot2.png")

      doc = Nokogiri::HTML(driver.page_source)
      doc.xpath('//*[@id="flexTable"]/tbody/tr').each do |tr|
        tr.css('td').each do |td|
          table_tr << td.text
        end
        table << table_tr
        table_tr = []
      end

      table.each do |table|
        unless table[0].blank?
          key = [:col1, :col2, :col3, :col4, :col5, :col6, :col7, :col8, :col9, :col10, :col11, :col12, :col13, :col14, :col15, :col16, :col17, :col18, :col19, :col20]
          ary = [key, table].transpose
          source = Hash[*ary.flatten]
          Source.find_or_initialize_by(col1: source[:col1]).update_attributes(source)
        end
      end

      driver.quit

    end
  end

end

      # driver.save_screenshot("screenshot.png")
      # driver.close

      # # 別タブで展開
      # driver.execute_script("window.open()") #make new tab
      # driver.switch_to.window(driver.window_handles[1]) #switch new tab

      # wait.until { driver.navigate.refresh }
      # wait.until{ !driver.find_element(id: 'flexTable').displayed? }
      # wait.until { driver.find_element(id: 'flexTable').displayed? }
      # e = wait.until { e.displayed? && e.enabled? }
      # wait.until { driver.displayed? && driver.enabled? }
      # wait.until { driver.element_to_be_clickable(:xpath, '//*[@id="flexTable"]/tbody/tr/td') }
      # sleep 2