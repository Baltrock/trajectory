class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:email])
    if @user &&user.authenticate(params[:user][:name])
      session[:user_id] = user.id
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

end
