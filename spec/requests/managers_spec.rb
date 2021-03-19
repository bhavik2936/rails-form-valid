require 'rails_helper'

RSpec.describe "Managers", type: :request do
  let(:manager) { create(:manager) }

  describe "GET /index" do
    it "renders index page" do
      get managers_path
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do
    it "renders manager show template" do
      get manager_path(manager)
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end

  describe "GET /new" do
    it "renders new manager page" do
      get new_manager_path
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe "POST /create" do
    context "with valid params" do
      let :manager do
        post managers_path, :params => { manager: attributes_for(:manager) }
      end

      it "inserts manager and redirects to page" do
        expect { manager }.to change(Manager, :count).by(1)
        expect(response).to be_redirect
      end
    end

    context "with invalid params" do
      let :manager do
        post managers_path, :params => { manager: attributes_for(:manager, name: nil) }
      end

      it "does not insert manager and re-render :new page" do
        expect { manager }.to_not change(Manager, :count)
        expect(response).to_not be_redirect
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET /edit" do
    it "renders new manager page" do
      get edit_manager_path(manager)
      expect(response).to be_successful
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT /update/:id" do
    context "with valid params" do
      it "updates manager and redirects" do
        put manager_path(manager), :params => { manager: attributes_for(:manager) }
        expect(response).to be_redirect
      end
    end

    context "with invalid params" do
      it "does not update the manager and re-render the form" do
        put manager_path(manager), :params => { manager: attributes_for(:manager, name: nil) }
        expect(response).to_not be_redirect
      end
    end
  end

  describe "DELETE /destroy/:id" do
    context "with valid params" do
      it "deletes manager and redirects" do
        delete manager_path(manager)
        expect(response).to be_redirect
      end
    end
  end
end
