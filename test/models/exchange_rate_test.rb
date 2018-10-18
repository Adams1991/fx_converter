require 'test_helper'

class ExchangeRateTest < ActiveSupport::TestCase
  def setup
    @exchangeRate = ExchangeRate.new()
    @exchangeRate.parse_xml_and_save_daily_rates(XmlDownloader.new().xml)
  end

  test "parsing and saving of rate from XML" do
    result_rate = ExchangeRate.find_by(currency: 'USD', time:'2018-10-17')['rate']
    assert_equal '1.153', result_rate
  end

  test "parsing and saving of currency from XML" do
    result_currency = ExchangeRate.find_by(rate: '1.1777', time:'2018-09-25')['currency']
    assert_equal 'USD', result_currency
  end

  test "parsing and saving of date from XML" do
    result_currency = ExchangeRate.find_by(currency: 'GBP', rate:'0.87945')['time']
    assert_equal '2018-10-17', result_currency
  end

  test "getting exchange rate back for certain day, currency pair" do
    result = @exchangeRate.at('2018-09-25', 'USD', 'JPY')
    assert_equal 112.74518, result
  end

  test "converting amount using calculated exchange rate" do
    result = @exchangeRate.convert_currency_using_specific_day_rates(100, '2018-09-25', 'USD', 'JPY')
    assert_equal 11274.518, result
  end
end
