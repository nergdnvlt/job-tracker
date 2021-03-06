class ContactsController < ApplicationController
  before_action :set_contact, only: %i[update edit destroy]

  def create
    @company = Company.find(params[:company_id])
    @contact = Contact.new(contact_params)
    @contact.company = @company
    flash.notice = "#{@contact.name} Contact Created!" if @contact.save

    redirect_to company_path(@company)
  end

  def edit
    @company = Company.find(params[:company_id])
  end

  def update
    if @contact.update(contact_params)
      flash.notice = "Contact #{@contact.name} Updated!"
      redirect_to company_path(params[:company_id])
    else
      render :edit
    end
  end

  def destroy
    flash.notice = 'Contact Deleted!' if @contact.destroy
    redirect_to company_path(params[:company_id])
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :position, :company_id)
  end
end
