class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        
        if user
            session[:user_id] = user.id
            redirect_to '/welcome'
        else
            redirect_to login_path
        end
        # return redirect_to '/signup' unless user
        # session[:user_id] = user.id

        # redirect_to '/welcome'
    end

    def destroy
        sessions.delete :name
    end
end
