class V1::Private::BaseController < ApplicationController
  # in real product I will use Devise or Knock
  include Authentication::HttpTokenAuthenticator

  before_action :authenticate

end
