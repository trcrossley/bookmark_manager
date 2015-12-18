feature 'User registration' do
  scenario 'So a new user can register' do
    expect { register }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com!')
    expect(User.first.email).to eq('alice@example.com')
  end
end
