module SpearWeb
  module Routes
    class Core < Sinatra::Application

      configure do
        set :public_folder, Spear.relative_to_root('public')
        set :root, Spear.relative_to_root('app')
        # set :environment, ENV.fetch('RACK_ENV') { :development }.to_sym

        set :method_override, true
        disable :static

        set :protection, except: :session_hijacking

        set :erb, escape_html: true

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
      use Rack::Flash

      helpers Helpers::CommonHelper

      helpers do
        def host
          request.host_with_port + root_path
        end

        def site_root
          host
        end

        def root_path
          '/'
        end

        def h(value)
          Rack::Utils.escape_html value
        end

        def link_to(path)
          File.join(root_path, path)
        end

        def css_url
          @css_url || "/css/application.css?t=#{File.mtime('./public/css/application.css').to_i}"
        end
      end
    end
  end
end