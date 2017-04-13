module SpearWeb
  module Routes
    class Port < Core
      get '/ports' do
        @title = 'Port'
        erb :'port/index'
      end

      get '/ports/new' do
        @title = 'Add Port'
        erb :'port/new_edit'
      end
    end
  end
end