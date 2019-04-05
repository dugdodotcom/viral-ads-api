Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    # origins 'localhost:8000', '0.0.0.0:8000'
    resource(
      '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization']
    )
  end
end