require 'rails_helper'

RSpec.describe Remote::User, type: :model do
  describe 'find' do
    subject { Remote::User.find(1) }

    let(:response_body) do
      {
        'name': 'John Doe',
        'email': 'john.DOE@example.com'
      }
    end

    before do
      stub_request(:get, "#{Remote::User::BASE_URL}/users/1")
        .to_return(body: response_body.to_json)
    end

    it { is_expected.to be_kind_of Remote::User }
    its(:name) { is_expected.to eq('john doe') }
    its(:email) { is_expected.to eq('john.doe@example.com') }
  end
end
