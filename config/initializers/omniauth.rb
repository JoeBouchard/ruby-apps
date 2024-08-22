using OpenIDConnect

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env == "test"
  provider :openid_connect, {
    name: :openid_connect,
    issuer: "http://host.docker.internal:8888/realms/Joe's-Ruby-Apps",
    discovery: false,
    scope: [ :openid, :email, :profile, :address ],
    response_type: :code,
    client_options: {
      port: 8888,
      host: "host.docker.internal",
      scheme: "http",
      identifier: "ruby-client",
      secret: "",
      redirect_uri: "http://localhost:3000/auth/openid_connect/callback",
      authorization_endpoint: "http://host.docker.internal:8888/realms/Joe's-Ruby-Apps/protocol/openid-connect/auth",
      token_endpoint: "http://host.docker.internal:8888/realms/Joe's-Ruby-Apps/protocol/openid-connect/token",
      userinfo_endpoint: "http://host.docker.internal:8888/realms/Joe's-Ruby-Apps/protocol/openid-connect/userinfo",
      jwks_uri: "http://host.docker.internal:8888/realms/Joe's-Ruby-Apps/protocol/openid-connect/certs"
    }
  } if Rails.env == "test"
end
OmniAuth.config.allowed_request_methods = [ :post, :get ]
