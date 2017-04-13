module SpearWeb
  module Routes
    class Host < Core
      get '/hosts' do
        @title = 'Server'
        erb :'host/index'
      end

      get '/hosts/new' do
        @title = 'Add Server'
        erb :'host/new_edit'
      end
    end
  end
end