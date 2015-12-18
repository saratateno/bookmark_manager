feature 'User signup' do
  scenario 'a user creates an account' do
    expect { add_user }.to change { User.count }.by(1)
    expect(page).to have_content "Welcome username@email.com!"
  end
end
