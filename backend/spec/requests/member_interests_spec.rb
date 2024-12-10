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

RSpec.describe "/member_interests", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # MemberInterest. As you add validations to MemberInterest, be sure to
  # adjust the attributes here as well.
  let(:valid_member_attributes) {
    {
      first_name: "John",
      last_name: "Doe",
      uin: 132123555,
      major: "Comp Sci",
      year: 2025,
      email: "ajzhou2003@tamu.edu",
      phone: 1234567890,
      tshirt_size: "S",
      aggie_ring_day: Date.today,
      birthday: Date.today,
      graduation_day: Date.today
    }
  }

  let(:valid_interest_attributes) {
    {
      interest_type: "career",
      name: "software developer"
    }
  }

  let(:valid_interest_attributes2) {
    {
      interest_type: "company",
      name: "software developer"
    }
  }

  let(:valid_interest_attributes3) {
    {
      interest_type: "personal",
      name: "software developer"
    }
  }

  let!(:member) { Member.create!(valid_member_attributes) }
  let!(:interest) { Interest.create!(valid_interest_attributes) }
  let!(:interest2) { Interest.create!(valid_interest_attributes) }
  let!(:interest3) { Interest.create!(valid_interest_attributes2) }
  let!(:interest4) { Interest.create!(valid_interest_attributes3) }
  let(:valid_attributes) {
    {
      uin: member.uin,
      interest_id: interest.id
    }
  }

  let(:valid_attributes2) {
    {
      uin: member.uin,
      interest_id: interest3.id
    }
  }

  let(:valid_attributes3) {
    {
      uin: member.uin,
      interest_id: interest4.id
    }
  }

  let(:invalid_attributes) {
    {
      uin: 1234
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # MemberInterestsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  let(:uin) { member.uin }
  let(:interest_id) { interest.id }

  describe 'GET /member_interests/exists/:uin/:interest_id' do
    it 'returns the existence of a member interest' do
      MemberInterest.create! valid_attributes
      get "/member_interests/exists/#{uin}/#{interest_id}"

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /member_interests/uin/career/:uin' do
    it 'returns career-related member interests by uin' do
      MemberInterest.create! valid_attributes
      get "/member_interests/uin/career/#{uin}"

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /member_interests/uin/company/:uin bad' do
    it 'returns company-related member interests by uin' do
      MemberInterest.create! valid_attributes
      get "/member_interests/uin/company/#{uin}"

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET /member_interests/uin/company/:uin good' do
    it 'returns company-related member interests by uin' do
      MemberInterest.create! valid_attributes2
      get "/member_interests/uin/company/#{uin}"

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /member_interests/uin/personal/:uin bad' do
    it 'returns personal-related member interests by uin' do
      MemberInterest.create! valid_attributes
      get "/member_interests/uin/personal/#{uin}"

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET /member_interests/uin/personal/:uin good' do
    it 'returns personal-related member interests by uin' do
      MemberInterest.create! valid_attributes3
      get "/member_interests/uin/personal/#{uin}"

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /member_interests/uin/:uin' do
    it 'deletes member interests by uin' do
      MemberInterest.create! valid_attributes
      delete "/member_interests/uin/#{uin}"

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /index" do
    it "renders a successful response" do
      MemberInterest.create! valid_attributes
      get member_interests_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      member_interest = MemberInterest.create! valid_attributes
      get member_interest_url(member_interest), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MemberInterest" do
        expect {
          post member_interests_url,
               params: { member_interest: valid_attributes }, headers: valid_headers, as: :json
        }.to change(MemberInterest, :count).by(1)
      end

      it "renders a JSON response with the new member_interest" do
        post member_interests_url,
             params: { member_interest: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MemberInterest" do
        expect {
          post member_interests_url,
               params: { member_interest: invalid_attributes }, as: :json
        }.to change(MemberInterest, :count).by(0)
      end

      it "renders a JSON response with errors for the new member_interest" do
        post member_interests_url,
             params: { member_interest: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          interest_id: interest2.id
        }
      }

      it "updates the requested member_interest" do
        member_interest = MemberInterest.create! valid_attributes
        patch member_interest_url(member_interest),
              params: { member_interest: new_attributes }, headers: valid_headers, as: :json
        member_interest.reload
        expect(member_interest.interest_id).to eq(interest2.id)
      end

      it "renders a JSON response with the member_interest" do
        member_interest = MemberInterest.create! valid_attributes
        patch member_interest_url(member_interest),
              params: { member_interest: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the member_interest" do
        member_interest = MemberInterest.create! valid_attributes
        patch member_interest_url(member_interest),
              params: { member_interest: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested member_interest" do
      member_interest = MemberInterest.create! valid_attributes
      expect {
        delete member_interest_url(member_interest), headers: valid_headers, as: :json
      }.to change(MemberInterest, :count).by(-1)
    end
  end
end