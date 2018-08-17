class UserController < ApplicationController
    def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @writes = current_user.writes.page(params[:page]).per(5).order("created_at DESC")
    end
end
