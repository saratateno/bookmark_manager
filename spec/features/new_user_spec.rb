feature 'new users' do
  xscenario 'new user signs up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome username@gmail.com')
    expect(User.first.email).to eq 'username@gmail.com'
  end

  scenario 'user signs up with mismatching password confirmation' do
    visit '/users/new'
    expect{ sign_up(password_confirmation:'pssword') }.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
    expect(flash[:password_failure]).to be_present
  end

end
