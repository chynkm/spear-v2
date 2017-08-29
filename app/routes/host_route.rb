module SpearWeb
  module Routes
    # Host route
    class HostRoute < CoreRoute

      # List hosts
      # @author Karthik M
      # @return :erb
      get '/hosts' do
        @title = 'Servers'
        hosts = Host.order('name ASC').paginate(page: params[:page])
        erb :'host/index', locals: { hosts: hosts }
      end

      # Add host
      # @author Karthik M
      # @return :erb
      get '/hosts/new' do
        @title = 'Add Server'
        erb :'host/new_edit', locals: { host: Host.new }
      end

      # Save host
      # @author Karthik M
      # @return nil
      post '/hosts' do
        host = Host.new(params[:host])
        if host.save
          flash[:status] = true
          flash[:message] = 'Server added successfully'
          redirect to('/hosts')
        else
          form_validation_fails(host.errors, params[:host])
        end
      end

      # Edit host
      # @author Karthik M
      # @param  id :int
      # @return :erb | redirect
      get '/hosts/:id/edit' do
        @title = 'Edit Server'
        host = Host.find_by_id(params[:id])
        if host.nil?
          host_not_found
        else
          erb :'host/new_edit', locals: { host: host }
        end
      end

      # Update host
      # @author Karthik M
      # @param  id :int
      # @return redirect
      patch '/hosts/:id' do
        host = Host.find_by_id(params[:id])
        if host.update(params[:host])
          flash[:status] = true
          flash[:message] = 'Server updated successfully'
          redirect to("/hosts/#{params[:id]}")
        else
          form_validation_fails(host.errors, params[:host])
        end
      end

      # Show host
      # @author Karthik M
      # @param  id :int
      # @return :erb
      get '/hosts/:id' do
        @title = 'View Server'
        host = Host.find_by_id(params[:id])
        if host.nil?
          host_not_found
        else
          erb :'host/show', locals: { host: host }
        end
      end

      # Toggle status
      # @author Karthik M
      # @param  id :int
      # @return redirect
      get '/hosts/:id/status' do
        host = Host.find_by_id(params[:id])
        if host.nil?
          host_not_found
        else
          host.update(active: host.active == 1 ? 0 : 1)
          flash[:status] = true
          flash[:message] = 'Server has been '+(host.active == 1 ? 'enabled' : 'disabled')+' for monitoring'
          redirect back
        end
      end

      # Delete host
      # @author Karthik M
      # @param  id :int
      # @return redirect
      get '/hosts/:id/delete' do
        host = Host.find_by_id(params[:id])
        if host.nil?
          host_not_found
        else
          host.destroy
          flash[:status] = true
          flash[:message] = 'Server deleted successfully'
          redirect back
        end
      end

      private

      # Host not found
      # @author Karthik M
      # @return redirect
      def host_not_found
        flash[:status] = false
        flash[:message] = 'The server you are trying to access was not found'
        redirect to('/hosts')
      end

    end
  end
end
