require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) {build(:user)}
it { expect(user).to respond_to(:email) }
=begin
  before { @user = FactoryGirl.build(:user) }
  it { expect(@user).to respond_to(:email) }
  it { expect(@user).to respond_to(:password) }
  it { expect(@user).to respond_to(:password_confirmation) }
  it { expect(@user).to be_valid? }
=end

# shoulda

context "when name is blank" do
  before(:each) { user.name = "" }

  it { expect(user).not_be_valid }
end

end
