module EmergenciesHelper

  def dispach_for_emergency
    responder = Responder.where(category: params[:category], available: true, on_duty:  true).first
    responder = Responder.where(category: params[:category], on_duty:  true).first if responder.blank?
    responder.update(available: false)
    return responder
  end

end