require 'rails_helper'

RSpec.describe "Managers", type: :request do
  describe "GET /index" do
    it "returns a successful reponse" do
      get managers_path
      expect(response).to be_successful
    end
    it "renders index page" do
      get managers_path
      expect(response).to render_template(:index)
    end
  end

  describe "GET /new" do
    it "returns a successful reponse" do
      get new_manager_path
      expect(response).to be_successful
    end
    it "renders new manager page" do
      get new_manager_path
      expect(response).to render_template(:new)
    end
  end

  describe "POST /create" do
    context "with valid params" do
      let :manager do
        post "/managers", :params => { manager: attributes_for(:manager) }
      end

      it { expect { manager }.to change(Manager, :count).by(1) }
    end

    context "without valid params" do
      let :manager do
        post "/managers", :params => { manager: attributes_for(:manager, name: nil) }
      end

      it { expect { manager }.to_not change(Manager, :count) }
    end
  end
end
