require 'rubygems'
require 'sinatra/base'
require 'active_record'
require 'rack/csrf'
require 'rack-flash'

require_relative 'app/routes'
require_relative 'app/helpers'
require_relative 'app/models'
require_relative 'app/spear'

$: << File.expand_path('../', __FILE__)

module SpearWeb
  class App < Sinatra::Base

    use Routes::Home
  end
end

# To easily access models in the console
include SpearWeb::Models