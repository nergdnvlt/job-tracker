class JobsController < ApplicationController
  before_action :set_jobs, only: %i[edit update destroy]

  def index
    return @jobs = job_by_category if category?
    return @jobs = job_by_location if location?
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title}!"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @job = Job.find(params[:id])
    @comments = @job.comments.order(created_at: :desc)
  end

  def edit; end

  def update
    @job.update(job_params)

    redirect_to job_path(params[:job_id])
  end

  def destroy
    @job.destroy

    redirect_to jobs_path
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

  def category?
    return true if params[:category]
  end

  def location?
    return true if params[:location]
  end

  def job_by_location
    Job.where(city: params[:location].to_s)
  end

  def job_by_category
    category = Category.find_by_name(params[:category.to_s])
    Job.where(category_id: category.id)
  end
end
