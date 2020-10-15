require 'rails_helper'

RSpec.describe ProjectController do
    let(:user) { instance_double(User) }
    before { log_in(user) }
    describe "GET #new" do
        it "returns status ok" do 
            get :new
            expect(response.status).to be(200)
        end
    end
end