require 'rubygems'
require 'sinatra/base'
require 'sinatra/content_for'
require 'sinatra/config_file'
require 'active_record'
require 'sinatra/activerecord'
require 'rack/csrf'
require 'sinatra/flash'
require 'sass'
require 'will_paginate'
require 'will_paginate/active_record'
require 'paranoia'
require 'pry'
require 'pry-remote'

require_relative 'app/routes'
require_relative 'app/helpers'
require_relative 'app/models'
require_relative 'lib/spear'
require_relative 'lib/will_paginate'

# To get autoload working correctly, you'll also need to ensure that the current directory is in the app's load path.
# You can do this by appending the CWD to the $LOAD_PATH (aliased to $:). Add the following to app.rb:
$: << File.expand_path('../', __FILE__)

module SpearWeb
  Paginate_nos = 10

  class App < Sinatra::Base
    register Sinatra::ConfigFile
    config_file 'config/config.yml'

    register Sinatra::ActiveRecordExtension
    set :database_file, Spear.relative_to_root('config/database.yml')

    register WillPaginate::Sinatra::Helpers
    WillPaginate::per_page = Paginate_nos

    not_found do
      redirect '/404'
    end

    use Routes::HomeRoute
    use Routes::HostRoute
    use Routes::PortRoute
  end
end

