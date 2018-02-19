module Authentication
  class TokenChecker

    SECURE_TOKEN = 'token'

    def initialize(token)
      @token = token
    end

    def check
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::MD5.hexdigest(@token),
        ::Digest::MD5.hexdigest(SECURE_TOKEN)
      )
    end
  end
end
