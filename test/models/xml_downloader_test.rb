require 'test_helper'
require 'nokogiri'


class XmlDownloaderTest < ActiveSupport::TestCase

  def setup
    @xmlDownloader = XmlDownloader.new()
  end

  test "get_XML_from_url() retreives XML from url" do
    @xmlDownloader.get_XML_from_url()
    doc = @xmlDownloader.xml
    # checks if data matches XML
    result = doc.xpath('//Cube/Cube')[0]["time"]
    assert_equal "2018-10-16", result
  end


  test "check data can be saved to db" do
    @xmlDownloader.get_XML_from_url()
    
  end


end
