require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { validate_presence_of :username }
    it { should validate_uniqueness_of(:username) }
    it { validate_presence_of :password }
    it { should have_secure_password }
  end
end
