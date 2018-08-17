class UserController < ApplicationController
    def show
    @nickname = current_user.nickname
    @writes = current_user.writes.page(params[:page]).per(5).order("created_at DESC")
    end
end
