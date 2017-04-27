module SpearWeb
  module Routes
    class HostRoute < CoreRoute
      get '/hosts' do
        @title = 'Server'
        hosts = Host.paginate(page: params[:page])
        erb :'host/index', locals: { hosts: hosts }
      end

      get '/hosts/new' do
        @title = 'Add Server'
        erb :'host/new_edit'
      end

      post '/hosts' do
        host = Host.new(params[:host])
        if host.save
          flash[:status] = true
          flash[:message] = 'Host saved successfully'
          redirect to('/hosts')
        else
          flash[:errors] = host.errors
          save_form_data_to_flash(params[:host])
          redirect back
        end
      end
    end
  end
end