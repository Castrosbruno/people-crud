require "rails_helper"

RSpec.describe ::AddressController, type: :controller do
  describe "#destroy" do
    let(:person) { create(:person) }
    let!(:address) { create(:address, person_id: person.id) }

    context "e apaga um endereço" do
      it "e passa um id correto" do
        expect do
          delete :destroy, params: { id: address.id }
        end.to change(Address, :count).by(-1)
      end

      it "e passa um id incorreto" do
        delete :destroy, params: { id: 10 }

        expect(response).to redirect_to("/")
      end
    end
  end
end
