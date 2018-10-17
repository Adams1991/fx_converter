require 'test_helper'

class DailyEuroExRateTest < ActiveSupport::TestCase
  def setup
    @dailyEuroExRate = DailyEuroExRate.new()
  end

  test "parsing and saving of rate from XML" do
    @dailyEuroExRate.parse_xml_and_save_daily_rates(XmlDownloader.new().xml)
    result = DailyEuroExRate.find_by(rate: '1.1777', time:"2018-09-25")['currency']
    assert_equal 'USD', result
  end
end
