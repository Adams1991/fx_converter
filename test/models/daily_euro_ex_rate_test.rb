require 'test_helper'

class DailyEuroExRateTest < ActiveSupport::TestCase
  def setup
    @dailyEuroExRate = DailyEuroExRate.new()
  end

  test "parsing and saving of rate from XML" do
    @dailyEuroExRate.parse_xml_and_save_daily_rates(  XmlDownloader.new().xml)
    result = DailyEuroExRate.find_by(time: '2018-10-16')
    assert_equal 0, result
  end
end
