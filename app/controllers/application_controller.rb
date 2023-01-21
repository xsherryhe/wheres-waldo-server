class ApplicationController < ActionController::Base
  after_action :send_csrf_token

  private

  def send_csrf_token
    cookies['CSRF-TOKEN'] =
      { value: form_authenticity_token,
        secure: true,
        domain: %w[localhost:3001 xsherryhe.github.io] }
  end
end
