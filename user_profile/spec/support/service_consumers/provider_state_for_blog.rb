Pact.provider_states_for 'Blog' do
  provider_state 'a user with id 100 exists' do
    set_up do
      User.create(id: 100, name: 'John Doe', email: 'john.DOE@example.com')
    end

    tear_down do
      User.find_by(id: 100)&.destroy
    end
  end
end
