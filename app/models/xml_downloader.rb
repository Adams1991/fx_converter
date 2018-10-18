require 'open-uri'
require 'nokogiri'
require 'openssl'

class XmlDownloader < ApplicationRecord
  def get_XML_from_url(url)
    doc = Nokogiri::XML(open("#{url}", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    return doc
  end
end
