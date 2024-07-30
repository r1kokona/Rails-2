require "rails_helper"
RSpec.describe "Users", type: :system do
    let!(:user) { create(:user, name: "Test User") }

    it "h1" do
        visit root_path
        expect(page).to have_content "Users"
    end
    describe 'index' do
        it 'ユーザーリストを表示する' do
            visit users_path
            expect(page).to have_content('Test User')
        end
    end
    
    describe 'show' do
        it 'ユーザーを表示する' do
            visit user_path(user)
            expect(page).to have_content('Test User')
        end
    end
    
    describe '新しいユーザー' do
        it '新しいユーザーを作成する' do
            visit new_user_path
            fill_in 'Name', with: 'New User'
            click_button 'Create User'
            expect(page).to have_content('New User')
        end
    end
    
    describe 'ユーザー情報を修正する' do
        it 'ユーザー名を書き換える' do
            visit edit_user_path(user)
            fill_in 'Name', with: 'Updated User'
            click_button 'Update User'
            expect(page).to have_content('Updated User')
        end
    end
    
    describe 'ユーザー削除' do
        it 'ユーザーを削除する' do
            visit users_path
            accept_confirm do
                click_link 'Destroy', href: user_path(@user)
            end
            expect(page).not_to have_content('Test User')
        end
    end
end
