require 'test_helper'
require 'nokogiri'

class XmlDownloaderTest < ActiveSupport::TestCase
  def setup
    @xmlDownloader = XmlDownloader.new
    @doc = @xmlDownloader.get_XML_from_url('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml')
  end

  test 'if get_XML_from_url() retreives XML from url without errors' do
    result = @doc.errors.length
    assert_equal 0, result
  end

  test 'if XML being downloaded has time attribute in correct place for parsing' do
    result = @doc.at_xpath('//*[@time]').nil?
    assert_equal false, result
  end

  test 'if XML being downloaded has currency attribute in correct place for parsing' do
    parent_with_time_attr = @doc.at_xpath('//*[@time]')
    result = parent_with_time_attr.at_xpath('./*[@currency]').nil?
    assert_equal false, result
  end

  test 'if XML being downloaded has rate attribute in correct place for parsing' do
    parent_with_time_attr = @doc.at_xpath('//*[@time]')
    result = parent_with_time_attr.at_xpath('./*[@rate]').nil?
    assert_equal false, result
  end
end
