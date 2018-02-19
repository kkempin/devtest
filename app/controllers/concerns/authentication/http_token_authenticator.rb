module Authentication
  module HttpTokenAuthenticator
    extend ActiveSupport::Concern

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        Authentication::TokenChecker.new(token).check
      end
    end
  end
end
