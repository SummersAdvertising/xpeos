# encoding: utf-8
class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  # GET /participants
  # GET /participants.json
  def index
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
end
