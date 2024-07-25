require "rails_helper"
RSpec.describe "viewing the h1", type: :system do
    # before do
    #     driven_by(:selenium_chrome)
    # end
    it "h1" do
        visit root_path
        expect(page).to have_content "Users"
    end
end