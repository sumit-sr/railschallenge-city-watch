class RespondersController < ApplicationController
  before_action :set_responder, only: [:show, :edit, :update, :destroy]

  def index
    @responders = Responder.all
    render json: @responders
  end

  # def show
  # end

  def new
    @responder = Responder.new
  end

  # def edit
  # end

  def create
    @responder = Responder.new(responder_params)
    msg = @responder.save ? 'Responder was successfully created.' : 'Unsuccessfull!'
    render json: msg
  end

  # def update
  #   respond_to do |format|
  #     if @responder.update(responder_params)
  #       format.html { redirect_to @responder, notice: 'Responder was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @responder }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @responder.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
