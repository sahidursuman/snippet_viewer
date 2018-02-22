require 'rails_helper'

RSpec.describe Snippet, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:body) }

  it 'has a valid factory' do
	expect(build(:snippet)).to be_valid
	end
end
