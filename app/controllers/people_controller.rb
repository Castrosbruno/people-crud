class PeopleController < ApplicationController
  before_action :set_person, only: %i[edit update destroy]

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    @address = Address.new
  end

  def edit
    @address = Address.find_by(person_id: @person.id) || Address.new
  end

  def create
    successfully_created, @person, @address = service.create(resource_params)

    if successfully_created
      redirect_to people_path, notice: "Pessoa criada com sucesso!!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    successfully_updated, @person, @address = service.update(resource_params, @person)

    if successfully_updated
      redirect_to people_path, notice: "Pessoa atualizada com sucesso!!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy

    redirect_to people_url, notice: "Pessoas excluída com sucesso!!"
  end

  private

  def service
    @service ||= ::CreateOrUpdatePerson.new
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def resource_params
    params.require(:person)
          .permit(:name, :email, :phone, :birthdate, address: %i[filled street city state postal_code country])
  end
end
