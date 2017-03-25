module SpearWeb
  module Routes
    class Home < Core
      get '/' do
        @appa = 'Appa';
        erb :'home/index'
      end

      # for information purpose - not being used
      get '/home/sass' do
        sass :'/sass/style'
      end
    end
  end
end