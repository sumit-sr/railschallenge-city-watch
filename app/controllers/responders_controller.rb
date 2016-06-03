class RespondersController < ApplicationController
  before_action :set_responder, only: [:show, :edit, :update, :destroy]

  def index
    @responders = Responder.all
    render json: @responders
  end

  def create
    @responder = Responder.new(responder_params)
    msg = @responder.save ? 'Responder was successfully created.' : 'Unsuccessfull!'
    render json: msg
  end

  def destroy
    msg = @responder.destroy ? 'Responder was successfully destroyed.' : 'Unsuccessfull!'
    render json: msg
  end

  private
    def set_responder
      @responder = Responder.find(params[:id])
    end

    def responder_params
      params.require(:responder).permit(:name, :category, :on_duty, :available)
    end
end
