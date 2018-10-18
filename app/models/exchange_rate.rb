class ExchangeRate < ApplicationRecord

  def parse_xml_and_save_daily_rates(xml)
      xml.xpath('//*[@time]').each do |day|
        day.xpath('./*[@rate and @currency]').each do |exh|
            ExchangeRate.create(:time => day['time'], :currency => exh['currency'], :rate => exh['rate'].to_s )
        end
      end
  end

  def input_incorrect(day, base, counter)
    day_check = ExchangeRate.find_by(time: day)
    base_check = ExchangeRate.find_by(time: base)
    counter_check = ExchangeRate.find_by(time: counter)

    return (!day_check && !base_check && !counter_check)
  end

  def at(day, base, counter)
    return "Invalid Input" if self.input_incorrect(day,base,counter)

    base_eur_rate = ExchangeRate.find_by(currency: base, time: day)['rate']
    counter_eur_rate = ExchangeRate.find_by(currency: counter, time: day)['rate']
    exchange_rate = counter_eur_rate.to_f/base_eur_rate.to_f

    return exchange_rate.round(5)
  end

  def convert_currency_using_specific_day_rates(amount, day, base, convert)
    conversion_rate = self.at(day, base, convert)
    
    return conversion_rate if conversion_rate.is_a? String

    return amount.to_f*conversion_rate
  end

 # method used in config/cronotab for daily download and saving
  def perform
    self.parse_xml_and_save_daily_rates(XmlDownloader.new().xml)
  end

end
