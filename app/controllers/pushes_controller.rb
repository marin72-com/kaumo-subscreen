class PushesController < ApplicationController

  before_action :require_user

  def index
    if params[:last_id]
      @pushes = Push.where('id > ?', params[:last_id])
    else 
      @pushes = Push.all
    end
    respond_to do |format|
      format.html
      format.json {
        render :json => @pushes.map { |push| push.as_json(include: :user) }
      }
    end
  end

  def new
  end

  def create
    Push.create!(user: current_user)
    redirect_to new_push_path
  end
end
