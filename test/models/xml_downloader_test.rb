require 'test_helper'

class XmlDownloaderTest < ActiveSupport::TestCase
  test "does can XML downloader retreive XML from url" do
    xmlDownloader = XmlDownloader.new
    result =  xmlDownloader.getXML()[0]
    assert_equal("", result)
  end
end
