require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:valid_attributes){
        { name: "Valid Name" }
    }
    let(:invalid_attributes){
        { name: "" }
    }

    describe "indexを取得" do
        it "正しいレスポンスが返ってくる" do
            User.create! valid_attributes
            get :index
            expect(response).to be_successful
        end
    end
    describe "showを取得" do
        it "正しいレスポンスが返ってくる" do
            user = User.create! valid_attributes
            get :show, params: { id: user.to_param }
            expect(response).to be_successful
        end
    end
    describe "newを取得" do
        it "正しいレスポンスが返ってくる" do
            get :new
            expect(response).to be_successful
        end
    end
    describe "createを送信する" do
        context "有効なパラメータを送信" do
            it "新しいユーザーを作成する" do
                expect{
                    post :create, params: { user: valid_attributes }
                }.to change(User, :count).by(1)
            end

            it "新しいユーザにリダイレクトする" do
                post :create, params: { user: valid_attributes }
                expect(response).to redirect_to(User.last)
            end
        end

        context "無効なパラメータを送信" do
            it "正しいレスポンスが返ってくる" do
                post :create, params: { user: invalid_attributes }
                # expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
    describe "editを取得する" do
        it "正しいレスポンスが返ってくる" do
            user = User.create! valid_attributes
            get :edit, params: { id: user.to_param }
            expect(response).to be_successful
        end
    end
    describe "updateを送信する" do
        context "有効なパラメータ" do
            let(:new_attributes) {
                { name: "New Name" }
            }

            it "リクエストされたユーザーを更新する" do
                user = User.create! valid_attributes
                put :update, params: { id: user.to_param, user: new_attributes }
                user.reload
                expect(user.name).to eq("New Name")
            end
            it "ユーザーにリダイレクトする" do
                user = User.create! valid_attributes
                put :update, params: { id: user.to_param, user: valid_attributes }
                expect(response).to redirect_to(user)
            end
        end
        context "無効なパラメータ" do
            it "正しいレスポンスが返ってくる" do
                user = User.create! valid_attributes
                put :update, params: { id: user.to_param, user: invalid_attributes }
                # expect(response).to be_successful
            end
        end
    end
    describe "destroy" do
        it "destroys the requested user" do
            user = User.create! valid_attributes
            expect {
              delete :destroy, params: { id: user.to_param }
            }.to change(User, :count).by(-1)
        end
        it "ユーザーリストにリダイレクトする" do
            user = User.create! valid_attributes
            delete :destroy, params: { id: user.to_param }
            expect(response).to redirect_to(root_path)
        end
    end
end