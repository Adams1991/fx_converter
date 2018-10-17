class DailyEuroExRate < ApplicationRecord

  def parse_xml_and_save_daily_rates(xml)
      xml.xpath('//Cube[@time]').each do |day|
        day.xpath('./Cube[@rate]').each do |exh|
            DailyEuroExRate.create(:time => day['time'], :currency => exh['currency'], :rate => exh['rate'].to_s )
        end
      end
  end

  def find_conversion_rate(day, base, convert)
    base_eur_rate = DailyEuroExRate.find_by(currency: base, time: day)['rate']
    convert_eur_rate = DailyEuroExRate.find_by(currency: convert, time: day)['rate']
    exchange_rate = convert_eur_rate.to_f/base_eur_rate.to_f
    return exchange_rate.round(5)
  end

  def convert_currency_using_specific_day_rates(amount, day, base, convert)
    conversion_rate = self.find_conversion_rate(day, base, convert)
    return amount.to_f*conversion_rate
  end

  def perform
    self.parse_xml_and_save_daily_rates(XmlDownloader.new().xml)
  end

end
