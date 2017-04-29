require 'rails_helper'

Rspec.describe 'Users api', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  before {host! "localhost:3000" }
  describe "GET /users/:id" do
    before do
      headers = {"Accept" => "application/vnd.taskmanager.v1"}
      get "/users/#{user_id}", params: {}, headers: headers
    end
    context "when user exists" do
      it "returns the user" do
        user_response = JSON.parse(response.body)
        except(user_response["id"]).to eq(user_id)
      end
    end
  end

end
