require 'rails_helper'

RSpec.describe "Stickies", type: :request do

  describe "GET /move" do
    it "returns http success" do
      get "/stickies/move"
      expect(response).to have_http_status(:success)
    end
  end

end
