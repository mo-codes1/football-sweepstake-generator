require 'rails_helper'

RSpec.describe CompetitionsController, type: :controller do
  describe "GET /competitions" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  # describe "GET /competitions/1" do
  #   it "responds with 200" do
  #     competition = Competition.new(name: "Africa Cup of Nations")
  #     competition.save
  #     get :show
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
