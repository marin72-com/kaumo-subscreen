class PushesController < ApplicationController

  before_action :require_user

  def index
  end

  def new
  end

  def create
    Push.create!(user: current_user)
    redirect_to new_push_path
  end
end
