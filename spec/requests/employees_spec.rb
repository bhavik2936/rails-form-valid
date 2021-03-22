require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let(:employee) { create(:employee) }
  
  describe "GET /index" do
    it "renders index page" do
      get employees_path
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do
    it "renders employee show template" do
      get employee_path(employee)
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end

  describe "GET /new" do
    it "renders new employee page" do
      get new_employee_path
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST /create" do
    context "with valid params" do
      let :employee do
        post employees_path, params: {
          employee: attributes_for(:employee, manager_id: create(:manager).id)
        }
      end

      it "inserts employee and redirects to page" do
        expect { employee }.to change(Employee, :count).by(1)
        expect(response).to be_redirect
      end
    end

    context "with invalid params" do
      let :employee do
        post employees_path, :params => { employee: attributes_for(:employee, name: nil) }
      end

      it "does not insert employee and re-render :new page" do
        expect { employee }.to_not change(Employee, :count)
        expect(response).to_not be_redirect
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET /edit" do
    it "renders new employee page" do
      get edit_employee_path(employee)
      expect(response).to be_successful
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT /update/:id" do
    context "with valid params" do
      it "updates employee and redirects" do
        put employee_path(employee), :params => { employee: attributes_for(:employee) }
        expect(response).to be_redirect
      end
    end

    context "with invalid params" do
      it "does not update the employee and re-render the form" do
        put employee_path(employee), :params => { employee: attributes_for(:employee, name: nil) }
        expect(response).to_not be_redirect
      end
    end
  end

  describe "DELETE /destroy/:id" do
    context "with valid params" do
      it "deletes employee and redirects" do
        delete employee_path(employee)
        expect(response).to be_redirect
      end
    end
  end
end
