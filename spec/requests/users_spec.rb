require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_attributes) {
    { name: "Valid Name" }
  }

  let(:invalid_attributes) {
    { name: "" }
  }

  describe "GET /users" do
    it "正しいレスポンスが返ってくる" do
      User.create! valid_attributes
      get users_path
      expect(response).to be_successful
    end
  end

  describe "GET /users/:id" do
    it "正しいレスポンスが返ってくる" do
      user = User.create! valid_attributes
      get user_path(user)
      expect(response).to be_successful
    end
  end

  describe "GET /users/new" do
    it "正しいレスポンスが返ってくる" do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe "POST /users" do
    context "有効なパラメータ" do
      it "ユーザーを作成する" do
        expect {
          post users_path, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "ユーザー作成にリダイレクトする" do
        post users_path, params: { user: valid_attributes }
        expect(response).to redirect_to(User.last)
      end
    end

    context "無効なパラメータ" do
      it "正しいレスポンスが返ってくる" do
        post users_path, params: { user: invalid_attributes }
        # expect(response).to be_unprocessable
      end
    end
  end

  describe "GET /users/:id/edit" do
    it "正しいレスポンスが返ってくる" do
      user = User.create! valid_attributes
      get edit_user_path(user)
      expect(response).to be_successful
    end
  end

  describe "PUT /users/:id" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "New Name" }
      }

      it "ユーザー情報がアップデートできる" do
        user = User.create! valid_attributes
        put user_path(user), params: { user: new_attributes }
        user.reload
        expect(user.name).to eq("New Name")
      end

      it "ユーザーページにリダイレクトする" do
        user = User.create! valid_attributes
        put user_path(user), params: { user: valid_attributes }
        expect(response).to redirect_to(user)
      end
    end

    context "無効なパラメータ" do
      it "正しいレスポンスが返ってくる" do
        user = User.create! valid_attributes
        put user_path(user), params: { user: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe "DELETE /users/:id" do
    it "ユーザーを削除する" do
      user = User.create! valid_attributes
      expect {
        delete user_path(user)
      }.to change(User, :count).by(-1)
    end

    it "ユーザーリストにリダイレクトする" do
      user = User.create! valid_attributes
      delete user_path(user)
      expect(response).to redirect_to(root_path)
    end
  end
end
