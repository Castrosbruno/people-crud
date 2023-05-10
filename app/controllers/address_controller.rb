class AddressController < ApplicationController
  def destroy
    address = Address.find(params[:id])
    person = address.person

    address.destroy

    redirect_to edit_person_path(person)
  end
end
