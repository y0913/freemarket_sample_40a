require 'rails_helper'
describe User do
  it "emailが空の状態で登録できないこと" do
    user = build(:user, email: nil )
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "emailが@なしで登録できないこと" do
    user = build(:user)
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end

  it "パスワードが空の状態で登録できないこと" do
    user = build(:user, password: nil )
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "パスワードの入力数が足りてないのに登録できないこと" do
    user = build(:user)
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
end
