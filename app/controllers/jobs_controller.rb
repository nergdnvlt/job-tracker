class JobsController < ApplicationController
  before_action :set_jobs, only: %i[edit update destroy show]

  def index
    case
    when params[:category] then @jobs = job_by_category
    when params[:location] then @jobs = job_by_location
    when params[:interest] then @jobs = job_by_interest
    when params[:sort] then @jobs = job_sort
    else @jobs = Job.all
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash.notice = "#{@job.title} Created!"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit; end

  def update
    if @job.update(job_params)
      flash.notice = "#{@job.title} Updated!"
      redirect_to job_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @job.destroy
      flash.notice = 'Job Deleted!'
      redirect_to jobs_path
    else
      redirect_to job_path(@job)
    end
  end

  private

  def set_jobs
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title,
                                :description,
                                :level_of_interest,
                                :city,
                                :company_id,
                                :category_id)
  end

  def job_by_location
    Job.where(city: params[:location])
  end

  def job_sort
    case params[:sort]
    when 'city' then Job.order(:city)
    when 'interest' then Job.order(level_of_interest: :desc)
    end
  end

  def job_by_category
    Job.where(category_id: Category.find_by_name(params[:category]).id)
  end

  def job_by_interest
    Job.group_interests[params[:interest].to_i - 1]
  end
end
