Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001', %r{\Ahttps?://xsherryhe.github.io}
    resource '*', headers: :any, methods: %i[get post patch put options delete], credentials: true, expose: ['CSRF-TOKEN']
  end
end

Rails.application.config.action_controller.forgery_protection_origin_check = false
