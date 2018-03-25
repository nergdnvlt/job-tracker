class DashboardController < ApplicationController

  def index
    @companies = Company.top_interests
    @jobs = Job.group_location
  end
end