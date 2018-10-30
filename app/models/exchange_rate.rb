class ExchangeRate < ApplicationRecord
  after_initialize :set_default_xml_attr

  def set_default_xml_attr(time = 'time', rate = 'rate', currency = 'currency', url = 'https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml')
    @url = url
    @time_xml_attr = time
    @rate_xml_attr = rate
    @currency_xml_attr = currency
    @xmlDownloader = XmlDownloader.new
  end

  def return_current_time_attr_setting
    @time_xml_attr
  end

  def return_current_rate_attr_setting
    @rate_xml_attr
  end

  def return_current_currency_attr_setting
    @currency_xml_attr
  end

  def return_current_url_setting
    @url
  end

  def parse_xml_and_save_daily_rates(xml)
    xml.xpath("//*[@#{@time_xml_attr}]").each do |day|
      day.xpath("./*[@#{@rate_xml_attr} and @#{@currency_xml_attr}]").each do |exh|
        ExchangeRate.create(time: day[@time_xml_attr.to_s], currency: exh[@currency_xml_attr.to_s], rate: exh[@rate_xml_attr.to_s].to_s)
      end
    end
  end

  def input_incorrect(day, base, counter)
    day_check = ExchangeRate.find_by(time: day)
    base_check = ExchangeRate.find_by(time: base)
    counter_check = ExchangeRate.find_by(time: counter)

    (!day_check && !base_check && !counter_check)
  end

  def at(day, base, counter)
    return 'Invalid Input' if input_incorrect(day, base, counter)

    base_eur_rate = ExchangeRate.find_by(currency: base, time: day)['rate']
    counter_eur_rate = ExchangeRate.find_by(currency: counter, time: day)['rate']
    exchange_rate = counter_eur_rate.to_f / base_eur_rate.to_f

    exchange_rate.round(5)
  end

  def convert_currency_using_specific_day_rates(amount, day, base, convert)
    conversion_rate = at(day, base, convert)

    return conversion_rate if conversion_rate.is_a? String

    amount.to_f * conversion_rate
  end

  # method used in config/cronotab for daily download and saving
  def perform
    parse_xml_and_save_daily_rates(@xmlDownloader.get_XML_from_url(@url))
  end
end
