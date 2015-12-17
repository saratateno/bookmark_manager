

feature 'new users' do
  scenario 'new user signs up' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome username@gmail.com.')
    expect(User.first.email).to eq 'username@gmail.com'
  end
end
