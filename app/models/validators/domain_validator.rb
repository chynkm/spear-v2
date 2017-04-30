require 'resolv'
require 'ipaddr'

# Domain validation
class DomainValidator < ActiveModel::EachValidator

  # validator each property of ActiveRecord
  # @author Karthik M
  # @param  record
  # @param  attribute
  # @param  value :string
  # @return :errors
  def validate_each(record, attribute, value)
    if valid_ip?(value) == false && valid_domain?(value) == false
      record.errors[attribute] << (options[:message] || 'is not a valid domain or an IP address')
    elsif valid_ip?(value) == false
      unless valid_domain?(value)
        record.errors[attribute] << (options[:message] || 'is not a valid domain')
      end
    else
      unless valid_ip?(value)
        record.errors[attribute] << (options[:message] || 'is not a valid IP')
      end
    end
  end

  # Validate URL
  # @author Karthik M
  # @param  domain :string
  # @return boolean
  def valid_domain?(domain)
   true if Resolv.getaddress domain
   rescue Resolv::ResolvError
   false
  end

  # Validate IP - currently v4
  # @author Karthik M
  # @param  domain :string
  # @return boolean
  def valid_ip?(ip)
    ip = IPAddr.new(ip)
    ip.ipv4?
    rescue IPAddr::InvalidAddressError
    false
  end
end

