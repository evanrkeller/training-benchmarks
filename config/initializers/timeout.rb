Rack::Timeout.timeout = Rails.env.test? ? 30 : 10 # seconds
