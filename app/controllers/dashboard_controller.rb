class DashboardController < ApplicationController

  def index
    @companies = Company.top_interests
    @jobs = Job.group_location
    @interests = Job.group_interests
  end
end