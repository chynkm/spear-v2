module SpearWeb
  module Routes
    # Home route
    class HomeRoute < CoreRoute

      # Index route
      # @author Karthik M
      # @return :erb
      get '/' do
        @title = 'Home'
        erb :'home/index', :locals => { :appa => 'Appa' }
      end

      # for information purpose - not being used
      get '/home/sass' do
        sass :'/sass/style'
      end

      # 404 page
      # @author Karthik M
      # @return :erb
      get '/404' do
        @title = '404'
        erb :'home/404'
      end
    end
  end
end