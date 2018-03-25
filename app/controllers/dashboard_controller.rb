class DashboardController < ApplicationController

  def index
    @companies = Company.top_interests
  end
end