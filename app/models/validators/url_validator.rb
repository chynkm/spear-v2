require 'uri'
require 'ipaddr'

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if valid_ip?(value) == false && valid_url?(value) == false
      record.errors[attribute] << (options[:message] || 'is not a valid URL or an IP address')
    elsif valid_ip?(value) == false
      unless valid_url?(value)
        record.errors[attribute] << (options[:message] || 'is not a valid URL')
      end
    else
      unless valid_ip?(value)
        record.errors[attribute] << (options[:message] || 'is not a valid IP')
      end
    end
  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
    rescue URI::InvalidURIError
    false
  end

  def valid_ip?(ip)
    ip = IPAddr.new(ip)
    # ip.ipv4? || ip.ipv6?
    ip.ipv4?
    rescue IPAddr::InvalidAddressError
    false
  end
end

