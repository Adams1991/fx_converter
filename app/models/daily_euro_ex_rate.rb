class DailyEuroExRate < ApplicationRecord


  def parse_xml_and_save_daily_rates(xml)
    xml.xpath('//Cube/Cube').each do |day|
      day.xpath('//Cube').each do |exch|
        DailyEuroExRate.create(:time => day['time'], :currency => exch['currency'], :rate => exch[rate].to_s )
      end
    end
  end


end
