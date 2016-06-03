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

  def responders
    all_responders = {}
    Responder.all.group_by(&:category).map{|type, data| all_responders[type] = data.count }
    available_responders = Responder.where(available: true).count
    on_duty_responders = Responder.where(on_duty: true).count
    on_duty_n_available_responders = Responder.where(available: true, on_duty: true).count
    render json: { all_responder: all_responders, available_responder: available_responders, on_duty_responder: on_duty_responders, on_duty_n_available_responder: on_duty_n_available_responders }
  end

  private
    def set_emergency
      @emergency = Emergency.find(params[:id])
    end

    def emergency_params
      params.require(:emergency).permit(:category, :description, :no_of_van)
    end
end
