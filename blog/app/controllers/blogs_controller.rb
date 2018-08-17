class BlogsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @writes = Write.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Write.create(name: write_params[:name], image: write_params[:image], text: write_params[:text], user_id: current_user.id)
  end

  def destroy
    write = Write.find(params[:id])
    if write.user_id == current_user.id
      write.destroy
    end
  end

    private
    def write_params
      params.permit(:name, :image, :text)
    end

    def move_to_index
      redirect_to :action => "index" unless user_signed_in?
    end

end
