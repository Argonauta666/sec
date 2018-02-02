require 'rails_helper'

RSpec.describe MaterialsController, type: :controller do
  let(:topic){ FactoryGirl.create(:topic) }
  let(:material){ FactoryGirl.create(:material) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      topic.lessons.take.update(
        suggested_materials: "/materials/#{material.to_param}"
      )

      get :show, params: { id: material.to_param }
      expect(response).to have_http_status(:success)
    end

    it "should protect unpublished content" do
      expect(controller).to receive(:protect_unpublished!)
      get :show, params: { id: material.slug }
    end
  end

end
