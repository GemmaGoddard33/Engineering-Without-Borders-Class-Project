require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/dietary_restrictions", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # DietaryRestriction. As you add validations to DietaryRestriction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      item_name: "cheese"
    }
  }

  let(:invalid_attributes) {
    {
      item_name: "cheese2"
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # DietaryRestrictionsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      DietaryRestriction.create! valid_attributes
      get dietary_restrictions_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      dietary_restriction = DietaryRestriction.create! valid_attributes
      get dietary_restriction_url(dietary_restriction), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new DietaryRestriction" do
        expect {
          post dietary_restrictions_url,
               params: { dietary_restriction: valid_attributes }, headers: valid_headers, as: :json
        }.to change(DietaryRestriction, :count).by(1)
      end

      it "renders a JSON response with the new dietary_restriction" do
        post dietary_restrictions_url,
             params: { dietary_restriction: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new DietaryRestriction" do
        expect {
          post dietary_restrictions_url,
               params: { dietary_restriction: invalid_attributes }, as: :json
        }.to change(DietaryRestriction, :count).by(0)
      end

      it "renders a JSON response with errors for the new dietary_restriction" do
        post dietary_restrictions_url,
             params: { dietary_restriction: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          item_name: "rocks"
        }
      }

      it "updates the requested dietary_restriction" do
        dietary_restriction = DietaryRestriction.create! valid_attributes
        patch dietary_restriction_url(dietary_restriction),
              params: { dietary_restriction: new_attributes }, headers: valid_headers, as: :json
        dietary_restriction.reload
        expect(dietary_restriction.item_name).to eq("rocks")
      end

      it "renders a JSON response with the dietary_restriction" do
        dietary_restriction = DietaryRestriction.create! valid_attributes
        patch dietary_restriction_url(dietary_restriction),
              params: { dietary_restriction: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the dietary_restriction" do
        dietary_restriction = DietaryRestriction.create! valid_attributes
        patch dietary_restriction_url(dietary_restriction),
              params: { dietary_restriction: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested dietary_restriction" do
      dietary_restriction = DietaryRestriction.create! valid_attributes
      expect {
        delete dietary_restriction_url(dietary_restriction), headers: valid_headers, as: :json
      }.to change(DietaryRestriction, :count).by(-1)
    end
  end
end