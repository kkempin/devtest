module ControllerSupport
  def response_json
    JSON.parse(response.body)
  end

  def authorization_headers(token)
    request.headers['Authorization'] = "Token token=\"#{token || user.authentication_token}\""
  end
end
