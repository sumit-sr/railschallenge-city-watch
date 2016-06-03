class EmergenciesController < ApplicationController
  before_action :set_emergency, only: [:show, :edit, :update, :destroy]

  def index
    @emergencies = Emergency.all
    render json: @emergencies
  end

  def create
    @emergency = Emergency.new(emergency_params)
    msg = @emergency.save ? 'Emergency was successfully created.' : 'Unsuccessfull!'
    render json: msg
  end

  def destroy
    msg = @emergency.destroy ? 'Responder was successfully destroyed.' : 'Unsuccessfull!'
    render json: msg
  end

  private
    def set_emergency
      @emergency = Emergency.find(params[:id])
    end

    def emergency_params
      params.require(:emergency).permit(:category, :description, :no_of_van)
    end
end
