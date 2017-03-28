module SpearWeb
  module Routes
    class Home < Core
      get '/' do
        @title = 'Home'
        erb :'home/index', :locals => { :appa => 'Appa' }
      end

      # for information purpose - not being used
      get '/home/sass' do
        sass :'/sass/style'
      end

      get '/404' do
        @title = '404'
        erb :'home/404'
      end
    end
  end
end