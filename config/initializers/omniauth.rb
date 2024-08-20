using OpenIDConnect

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env == "docker"
  provider :openid_connect, {
    name: :openid_connect,
    issuer: "http://localhost:8888/realms/Joe's-Ruby-Apps",
    discovery: false,
    scope: [ :openid, :email, :profile, :address ],
    response_type: :code,
    client_options: {
      port: 8888,
      host: "localhost",
      scheme: "http",
      identifier: "ruby-client",
      secret: ENV["OP_SECRET_KEY"],
      redirect_uri: "http://localhost:3000/auth/openid_connect/callback",
      authorization_endpoint: "http://localhost:8888/realms/Joe's-Ruby-Apps/protocol/openid-connect/auth",
      token_endpoint: "http://localhost:8888/realms/Joe's-Ruby-Apps/protocol/openid-connect/token",
      userinfo_endpoint: "http://localhost:8888/realms/Joe's-Ruby-Apps/protocol/openid-connect/userinfo",
      jwks_uri: "http://localhost:8888/realms/Joe's-Ruby-Apps/protocol/openid-connect/certs"
    }
  }
end
OmniAuth.config.allowed_request_methods = [ :post, :get ]
