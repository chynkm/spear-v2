require 'rubygems'
require 'sinatra/base'
require 'sinatra/content_for'
require 'active_record'
require 'rack/csrf'
require 'rack-flash'
require 'sass'

require_relative 'app/routes'
require_relative 'app/helpers'
require_relative 'app/models'
require_relative 'app/spear'

$: << File.expand_path('../', __FILE__)

module SpearWeb
  class App < Sinatra::Base

    not_found do
     redirect '/404'
    end

    use Routes::Home
  end
end

# To easily access models in the console
include SpearWeb::Models