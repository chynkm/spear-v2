module SpearWeb
  module Routes
    # Port route
    class PortRoute < CoreRoute

      # List ports
      # @author Karthik M
      # @return :erb
      get '/ports' do
        @title = 'Ports'
        ports = Port.order('name ASC').paginate(page: params[:page])
        erb :'port/index', locals: { ports: ports }
      end

      # Add port
      # @author Karthik M
      # @return :erb
      get '/ports/new' do
        @title = 'Add Port'
        erb :'port/new_edit', locals: { port: Port.new }
      end

      # Save port
      # @author Karthik M
      # @return nil
      post '/ports' do
        port = Port.new(params[:port])
        if port.save
          flash[:status] = true
          flash[:message] = 'Port added successfully'
          redirect to('/ports')
        else
          form_validation_fails(port.errors, params[:port])
        end
      end

      # Edit port
      # @author Karthik M
      # @param  id :int
      # @return :erb | redirect
      get '/ports/:id/edit' do
        @title = 'Edit Port'
        port = Port.find_by_id(params[:id])
        if port.nil?
          port_not_found
        else
          erb :'port/new_edit', locals: { port: port }
        end
      end

      # Update port
      # @author Karthik M
      # @param  id :int
      # @return redirect
      patch '/ports/:id' do
        port = Port.find_by_id(params[:id])
        if port.update(params[:port])
          flash[:status] = true
          flash[:message] = 'Port updated successfully'
          redirect to("/ports/#{params[:id]}")
        else
          form_validation_fails(port.errors, params[:port])
        end
      end

      # Show port
      # @author Karthik M
      # @param  id :int
      # @return :erb
      get '/ports/:id' do
        @title = 'View Port'
        port = Port.find_by_id(params[:id])
        if port.nil?
          port_not_found
        else
          erb :'port/show', locals: { port: port }
        end
      end

      # Toggle port status
      # @author Karthik M
      # @param  id :int
      # @return redirect
      get '/ports/:id/status' do
        port = Port.find_by_id(params[:id])
        if port.nil?
          port_not_found
        else
          port.update(active: port.active == 1 ? 0 : 1)
          flash[:status] = true
          flash[:message] = 'Port has been '+(port.active == 1 ? 'enabled' : 'disabled')+' for monitoring'
          redirect back
        end
      end

      # Delete port
      # @author Karthik M
      # @param  id :int
      # @return redirect
      get '/ports/:id/delete' do
        port = Port.find_by_id(params[:id])
        if port.nil?
          port_not_found
        else
          port.destroy
          flash[:status] = true
          flash[:message] = 'Port deleted successfully'
          redirect back
        end
      end

      private

      # Port not found
      # @author Karthik M
      # @return redirect
      def port_not_found
        flash[:status] = false
        flash[:message] = 'The port you are trying to access was not found'
        redirect to('/ports')
      end
    end
  end
end
