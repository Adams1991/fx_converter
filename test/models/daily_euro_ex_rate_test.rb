require 'test_helper'

class DailyEuroExRateTest < ActiveSupport::TestCase
  def setup
    @dailyEuroExRate = DailyEuroExRate.new()
    @dailyEuroExRate.parse_xml_and_save_daily_rates(XmlDownloader.new().xml)
  end

  test "parsing and saving of rate from XML" do
    result_currency = DailyEuroExRate.find_by(rate: '1.1777', time:'2018-09-25')['currency']
    result_rate = DailyEuroExRate.find_by(currency: 'USD', time:'2018-09-25')['rate']
    assert_equal 'USD', result_currency
    assert_equal '1.1777', result_rate
  end

  test "getting exchange rate back for certain day, currency pair" do
    result = @dailyEuroExRate.find_conversion_rate('2018-09-25', 'USD', 'JPY')
    assert_equal 112.74518, result
  end

  test "converting amount using exchange rate" do
    result = @dailyEuroExRate.convert_currency_using_specific_day_rates(100, '2018-09-25', 'USD', 'JPY')
    assert_equal 11274.518, result
  end
end
