class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    if @company = Company.create(company_params)
      flash[:success] = "#{@company.name} Added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @contact = Contact.new
  end

  def edit; end

  def update
    if @company.update(company_params)
      flash[:success] = "#{@company.name} Updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company.destroy

    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
