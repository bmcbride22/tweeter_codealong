class ProfilesController < ApplicationController
  def show
    @profile = User.fin(params[:id])
  end
end
