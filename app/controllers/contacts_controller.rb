class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @contact = Contact.new(contact_params)
    @contact.company = @company
    @contact.save

    redirect_to company_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :position)
  end
end