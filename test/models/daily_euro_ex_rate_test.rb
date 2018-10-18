require 'test_helper'

class DailyEuroExRateTest < ActiveSupport::TestCase

  def setup
    @dailyEuroExRate = DailyEuroExRate.new()
    @dailyEuroExRate.parse_xml_and_save_daily_rates(XmlDownloader.new().xml)
  end

  test "parsing and saving of rate from XML" do
    result_rate = DailyEuroExRate.find_by(currency: 'USD', time:'2018-10-17')['rate']
    assert_equal '1.153', result_rate
  end

  test "parsing and saving of currency from XML" do
    result_currency = DailyEuroExRate.find_by(rate: '1.1777', time:'2018-09-25')['currency']
    assert_equal 'USD', result_currency
  end

  test "parsing and saving of date from XML" do
    result_currency = DailyEuroExRate.find_by(currency: 'GBP', rate:'0.87945')['time']
    assert_equal '2018-10-17', result_currency
  end

  test "getting exchange rate back for certain day, currency pair" do
    result = @dailyEuroExRate.find_conversion_rate('2018-09-25', 'USD', 'JPY')
    assert_equal 112.74518, result
  end

  test "converting amount using calculated exchange rate" do
    result = @dailyEuroExRate.convert_currency_using_specific_day_rates(100, '2018-09-25', 'USD', 'JPY')
    assert_equal 11274.518, result
  end

end
