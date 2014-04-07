# encoding: utf-8
class XpUsersController < ApplicationController
  before_action :set_xp_user, only: [:show, :edit, :update, :destroy]
  before_filter :allow_iframe_requests
  before_filter  :set_p3p, only: [ :new, :create ]

  before_filter :authenticate_download, only: [:export]


  layout false

  # GET /xp_users/new
  def new
    @xp_user = XpUser.new
  end

  
  def export
  	@xp_users = XpUser.order( :created_at => :desc )
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
    
    
    def authenticate_download
    
    	if request.remote_ip != '127.0.0.1' && request.remote_ip != '220.133.14.87'
    		puts 'ip 不允許，跳離。'
    		redirect_to root_url
    	end
    
    	authenticate_or_request_with_http_basic do |username, password|
    	  if Digest::SHA1.hexdigest( username ) == 'c34ff016869b9f77e92064651c867f1eee8cb506' && Digest::SHA1.hexdigest( password ) == 'fae787a2334dd261e3344e7ff59d0230f0259ef6'    	  
    	  	true
    	  else
    	  	session[ :try_download ] = session[ :try_download ].nil? ? 0 : session[ :try_download ]+1
    	  	
    	  	if session[ :try_download ] > 5
    	  		redirect_to root_url
    	  	end    	  	
    	  end
	    end
    end

end
