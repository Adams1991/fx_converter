require 'test_helper'
require 'nokogiri'


class XmlDownloaderTest < ActiveSupport::TestCase

  def setup
    @xmlDownloader = XmlDownloader.new()
    @xmlDownloader.get_XML_from_url()
    @doc = @xmlDownloader.xml
  end

  test "if get_XML_from_url() retreives XML from url without errors" do
    result = @doc.errors.length
    assert_equal 0, result
  end

  test "if XML being downloaded has time attribute in correct place" do
    result = @doc.at_xpath('//Cube/Cube')["time"].nil?
    assert_equal false, result
  end

  test "if XML being downloaded has currency attribute in correct place" do
    result = @doc.at_xpath('//Cube/Cube/Cube')["currency"].nil?
    assert_equal false, result
  end

  test "if XML being downloaded has rate attribute in correct place" do
    result = @doc.at_xpath('//Cube/Cube/Cube')["rate"].nil?
    assert_equal false, result
  end



# TODO: futher test cases could be added to check date and rate attributes



end
