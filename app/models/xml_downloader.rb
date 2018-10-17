require 'open-uri'
require 'nokogiri'
# below required as receiving SSLError
require 'openssl'

class XmlDownloader < ApplicationRecord
  attr_accessor(:xml)

  def initialize()
    @xml = []
    self.get_XML_from_url()
  end
  # removing namespaces as causing issues with working data structure. Please let me know if there was a better way.
  def get_XML_from_url()
    doc = Nokogiri::XML(open("https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml",ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    @xml = doc.remove_namespaces!
  end
  # used to for initial testing of scheduler leaving atm for safeguard
  def perform
    self.get_XML_from_url()
  end

end
