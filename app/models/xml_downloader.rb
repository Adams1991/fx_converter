require 'open-uri'
require 'nokogiri'
# below required as receiving SSLError
require 'openssl'


class XmlDownloader < ApplicationRecord
  attr_accessor(:xml)

  def initialize()

  end

  def get_XML_from_url()
    doc = Nokogiri::XML(open("https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml",
      ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    # removing namespaces as causing issues with working data structure. Please let me know if this was incorrect 
    return doc.remove_namespaces!
  end

end
