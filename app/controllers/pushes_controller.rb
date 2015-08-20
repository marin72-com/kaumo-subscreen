class PushesController < ApplicationController

  before_action :require_user

  def index
  end

  def create
    Push.create!(user: current_user)
    redirect_to pushes_path
  end
end
