class SessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to account_url
  end
end