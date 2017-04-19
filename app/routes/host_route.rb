module SpearWeb
  module Routes
    class HostRoute < CoreRoute
      get '/hosts' do
        @title = 'Server'
        erb :'host/index'
      end

      get '/hosts/new' do
        @title = 'Add Server'
        erb :'host/new_edit'
      end

      post '/hosts' do
        host = Host.new(params[:host])
        if host.save
          flash[:status] = true
          flash[:notice] = 'Host saved successfully'
          redirect to('/hosts')
        else
          # flash[:host] = params[:host]
          flash[:errors] = host.errors
          redirect back
        end
      end
    end
  end
end