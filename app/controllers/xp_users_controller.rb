# encoding: utf-8
class XpUsersController < ApplicationController
  before_action :set_xp_user, only: [:show, :edit, :update, :destroy]
  before_filter :allow_iframe_requests
  before_filter  :set_p3p


  layout false

  # GET /xp_users/new
  def new
    @xp_user = XpUser.new
  end


  # POST /xp_users
  # POST /xp_users.json
  def create
    @xp_user = XpUser.new(xp_user_params)

    respond_to do |format|
      if @xp_user.save
        format.html { redirect_to new_xp_user_path, notice: '恭喜您已經成功取得抽獎資格，請繼續注意本網站公告喔！' }
        format.json { render action: 'show', status: :created, location: @xp_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @xp_user.errors, status: :unprocessable_entity }
      end
    end
  end


  def allow_iframe_requests
	response.headers['X-Frame-Options'] = "ALLOW"
  end

	def set_p3p
	  response.headers["P3P"]='CP="CAO PSA OUR"'
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xp_user
      @xp_user = XpUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xp_user_params
      params.require(:xp_user).permit(:name, :phone, :email, :address, :fb_user_id, :fb_share_id, :access_token)
    end
end
