require 'test_helper'
require 'nokogiri'

class XmlDownloaderTest < ActiveSupport::TestCase

  def setup
    @xmlDownloader = XmlDownloader.new()
  end

  test "get_XML_from_url() retreives XML from url" do
    doc =  @xmlDownloader.xml
    result = doc.xpath('//Cube/Cube')[0]["time"]
    assert_equal("2018-10-16", result)
  end

  test "can schedule url upload at specific time/interval" do
    
  end


end
