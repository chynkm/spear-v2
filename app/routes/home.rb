module SpearWeb
  module Routes
    class Home < Core
      get '/' do
        @appa = 'Appa';
        erb :'home/index'
      end
    end
  end
end