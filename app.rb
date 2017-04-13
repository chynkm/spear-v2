require 'rubygems'
require 'sinatra/base'
require 'sinatra/content_for'
require 'sinatra/config_file'
require 'active_record'
require 'sinatra/activerecord'
require 'rack/csrf'
require 'rack-flash'
require 'sass'

require_relative 'app/routes'
require_relative 'app/helpers'
require_relative 'app/models'
require_relative 'lib/spear'

# To get autoload working correctly, you'll also need to ensure that the current directory is in the app's load path.
# You can do this by appending the CWD to the $LOAD_PATH (aliased to $:). Add the following to app.rb:
$: << File.expand_path('../', __FILE__)

module SpearWeb
  class App < Sinatra::Base
    register Sinatra::ConfigFile
    config_file 'config/config.yml'

    register Sinatra::ActiveRecordExtension
    set :database_file, Spear.relative_to_root('config/database.yml')

    not_found do
     redirect '/404'
    end

    use Routes::Home
    use Routes::Host
    use Routes::Port
  end
end

