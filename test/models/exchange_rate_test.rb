require 'test_helper'

class ExchangeRateTest < ActiveSupport::TestCase
  def setup
    @exchangeRate = ExchangeRate.new
    xmlDownloader = XmlDownloader.new
    @exchangeRate.parse_xml_and_save_daily_rates(xmlDownloader.get_XML_from_url('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'))
  end

  test 'parsing and saving of rate from XML' do
    result_rate = ExchangeRate.find_by(currency: 'USD', time: '2018-10-17')['rate']
    assert_equal '1.153', result_rate
  end

  test 'parsing and saving of currency from XML' do
    result_currency = ExchangeRate.find_by(rate: '1.1777', time: '2018-09-25')['currency']
    assert_equal 'USD', result_currency
  end

  test 'parsing and saving of date from XML' do
    result_currency = ExchangeRate.find_by(currency: 'GBP', rate: '0.87945')['time']
    assert_equal '2018-10-17', result_currency
  end

  test 'incorrect input works for day' do
    result = @exchangeRate.input_incorrect('2020-09-25', 'USD', 'JPY')
    assert_equal true, result
  end

  test 'incorrect input works for base' do
    result = @exchangeRate.input_incorrect('2020-09-25', 'UQD', 'JPY')
    assert_equal true, result
  end

  test 'incorrect input works for counter' do
    result = @exchangeRate.input_incorrect('2020-09-25', 'USD', 'JP3')
    assert_equal true, result
  end

  test 'getting exchange rate back for certain day, currency pair' do
    result = @exchangeRate.at('2018-09-25', 'USD', 'JPY')
    assert_equal 112.74518, result
  end

  test 'converting amount using calculated exchange rate' do
    result = @exchangeRate.convert_currency_using_specific_day_rates(100, '2018-09-25', 'USD', 'JPY')
    assert_equal 11_274.518, result
  end

  test 'changing xml attr works for time attr' do
    @exchangeRate.set_default_xml_attr('day', 'rate', 'currency')
    result = @exchangeRate.return_current_time_attr_setting
    assert_equal 'day', result
  end
end
