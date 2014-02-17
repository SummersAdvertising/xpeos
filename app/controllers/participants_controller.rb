# encoding: utf-8
class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_download, only: [:export]


  def export
  	@participants = Participant.order( :created_at => :desc )
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    
    @participant.ip = request.remote_ip
    
    respond_to do |format|
      if @participant.save
        format.html { redirect_to new_participant_path, notice: '我們收到您的資料囉，感謝您的參與，也祝您中獎！' }

      else

      	flash[ :warning ] = @participant.errors.values.flatten.join('<br />')
      
        format.html { render action: 'new' }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:name, :phone, :email, :address, :key, :product, :extra, :extra_brand, :extra_product, :cpu)
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
