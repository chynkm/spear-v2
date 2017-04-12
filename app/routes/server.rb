module SpearWeb
  module Routes
    class Server < Core
      get '/servers' do
        @title = 'Server'
        erb :'server/index'
      end

      get '/servers/new' do
        @title = 'Add Server'
        erb :'server/new_edit'
      end
    end
  end
end