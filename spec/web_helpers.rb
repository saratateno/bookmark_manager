def sign_up(email: 'username@gmail.com',
            password: 'password',
            password_confirmation: 'password')
  visit '/users/new'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  click_button 'Create account'
end
