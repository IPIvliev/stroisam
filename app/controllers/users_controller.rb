# encoding: UTF-8

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @users = initialize_grid(User,
        order:           'users.created_at',
        order_direction: 'desc',
    )
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @articles = User.find(params[:id]).articles.where("view = true").order("created_at DESC").page params[:page]
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end   

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :avatar, :avatar_cache, :remove_avatar)
    end
end
