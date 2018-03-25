class DashboardController < ApplicationController

  def index
    @companies = Company.top_interests
    @locations = Job.distinct.pluck(:city)
  end
end