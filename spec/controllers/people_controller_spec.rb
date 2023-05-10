require "rails_helper"

RSpec.describe ::PeopleController, type: :controller do
  let!(:params) { json_file_fixture("/spec/fixtures/files/params_to_create_person_and_address.json") }
  let!(:person) { create(:person) }

  describe "#index" do
    it "e lista todos os dados" do
      get :index

      expect(assigns(:people)).to include(person)
    end
  end

  describe "#new" do
    before do
      get :new
    end

    it "atribui variável person" do
      expect(assigns(:person)).to be_a_new(Person)
    end

    it "atribui variável address" do
      expect(assigns(:address)).to be_a_new(Address)
    end
  end

  describe "#create" do
    context "quando cria corretamente" do
      it "com endereço" do
        post(:create, params:)

        expect(Person.last.name).to eq("teste")
      end

      it "sem endereço" do
        params["person"]["address"]["filled"] = "0"

        post(:create, params:)

        expect(assigns(:address)).to be_a_new(Address)
      end
    end

    context "quando cria com dados incorretos" do
      it "com dados faltantes da pessoa" do
        params["person"]["email"] = ""
        post(:create, params:)

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#edit" do
    let!(:person) { create(:person) }

    it "atribui um endereço existente caso a pessoa exista e tenha um endereço" do
      address = create(:address, person_id: person.id)

      get :edit, params: { id: person.id }
      expect(assigns(:address)).to eq(address)
    end

    it "atribui um novo endereço caso não exista um endereço para a pessoa" do
      get :edit, params: { id: person.id }
      expect(assigns(:address)).to be_a_new(Address)
    end
  end

  describe "#update" do
    context "quando passa os parâmetros corretamente" do
      before do
        params["person"]["name"] = "teste update"

        put(:update, params: params.merge({ id: person.id }))
      end

      it "e atualiza o nome da pessoa" do
        expect(person.reload.name).to eq("teste update")
      end
    end

    context "quando não passa os parâmetros corretamente" do
      it "e não atualiza" do
        params["person"]["address"]["street"] = ""
        put(:update, params: params.merge({ id: person.id }))

        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#destroy" do
    context "quando apaga uma pessoa" do
      before do
        delete :destroy, params: { id: person.id }
      end

      it "sem endereço" do
        expect(Person.where(id: person.id)).not_to exist
      end
    end
  end
end
