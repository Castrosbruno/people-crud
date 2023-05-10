class CreateOrUpdatePerson
  def create(params)
    address_params = params[:address]
    person = Person.new(params.except(:address))
    valid_person = person.valid?
    address = if address_params["filled"].to_i == 1
                person.build_address(address_params)
              else
                Address.new
              end

    if valid_person && (address || address.valid?)
      [person.save, person, address]
    else
      [false, person, address]
    end
  end

  def update(params, person)
    address = Address.find_or_initialize_by(person_id: person.id)
    valid_person = person.valid?
    address.update(params[:address])
    valid_address = address.valid?

    return [false, person, address] unless valid_person && valid_address

    [person.update(params.except(:address)), person, address]
  end
end
