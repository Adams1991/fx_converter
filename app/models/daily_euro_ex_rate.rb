class DailyEuroExRate < ApplicationRecord


  def parse_xml_and_save_daily_rates(xml)
      xml.xpath('//Cube[@time]').each do |day|
        day.xpath('./Cube[@rate]').each do |exh|
            DailyEuroExRate.create(:time => day['time'], :currency => exh['currency'], :rate => exh['rate'].to_s )
        end
      end
  end

  def perform
    self.parse_xml_and_save_daily_rates(XmlDownloader.new().xml)
  end



end
