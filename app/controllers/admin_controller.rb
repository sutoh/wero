class AdminController < ApplicationController
  def index
    @total_users = User.Count
  end
end
