module SpearWeb
  module Routes
    # Core route - All route use Core as base
    class CoreRoute < Sinatra::Application

      configure do
        set :public_folder, Spear.relative_to_root('public')
        set :root, Spear.relative_to_root('app')
        # set :environment, ENV.fetch('RACK_ENV') { :development }.to_sym
        set :method_override, true
        disable :static

        set :protection, except: :session_hijacking
        set :erb, escape_html: true
        enable :sessions
        set :sessions,
            :httponly     => true,
            :secure       => false,
            :path         => '/',
            :expire_after => 7200,
            :secret       => 'my_long_secret'

        enable :raise_errors
      end

      configure :production do
        disable :show_exceptions
      end

      configure :development, :test do
        # Comment out this line if you want
        # to see the gorgeous 500 page
        enable :show_exceptions
      end

      before do
        cache_control :private
      end

      use Rack::Deflater
      use Rack::Csrf
      register Sinatra::Flash

      helpers Sinatra::ContentFor
      helpers Helpers::ApplicationHelper
    end
  end
end