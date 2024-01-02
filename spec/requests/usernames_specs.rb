require "rails_helper"

RSpec.describe "Usernames", type: :request do
  let(:user) { create(:user), username: nil }

  before { sign_in user }

  describe "GET new" do
    it "is successful" do
      get new_usernames_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    it "updates the username" do
      expect do
        put usernames_path(user), params: {
          users: {
            username: "foobar"
          }
        }.to change { user.reload.username }.from(nil).to("foobar")
      end
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
