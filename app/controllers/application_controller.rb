class ApplicationController < ActionController::Base
  after_action :send_csrf_token

  rescue_from ActiveRecord::RecordNotFound do
    head :unprocessable_entity
  end

  def init
    head :ok
  end

  private

  def send_csrf_token
    return unless /localhost|xsherryhe.github.io/ =~ request.origin

    headers['CSRF-TOKEN'] = form_authenticity_token
  end
end
