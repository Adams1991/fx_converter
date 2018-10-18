require 'open-uri'
require 'nokogiri'
require 'openssl'

class XmlDownloader < ApplicationRecord
  attr_accessor(:xml)

  def initialize()
    @xml = []
    self.get_XML_from_url()
  end

  def get_XML_from_url()
    doc = Nokogiri::XML(open("https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml",ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    @xml = doc
  end

end
