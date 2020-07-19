require 'httparty'
require 'nokogiri'

class Info

  attr_accessor :page
  
  def initialize()
      doc = HTTParty.get("https://www.gismeteo.ru/")
      @page = Nokogiri::HTML(doc)
  end
  def prin()
    string = ""
    string1 = ""
    @page.xpath('//span[@class = "value unit unit_temperature_c"]').each do |el|
      string += el.text
    end
    @page.xpath('//div[@class = "description gray"]').each do |el|
      string1 += el.text
    end
    arr = string.split(' ')
    string = arr[0] + ' ' + string1.split(' ')[0]
    File.open('js/weather.txt', 'w') {  |file| 
        file.write(string)
    }
  end

end
# print("Enter the tracking number: ")
# inf = gets
# inst = Info.new(inf.slice(..-2))
inst = Info.new()
inst.prin
