class SessionsController < ApplicationController
    def new
    end

    def create
        user = AdminUser.find_by(name: params[:session][:name].downcase)
        if user && user.password == params[:session][:password]
            # Log the user in and redirect to the dashboard page.
            log_in user
            redirect_to home_path
        else
            # Create an error message.
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end
end
