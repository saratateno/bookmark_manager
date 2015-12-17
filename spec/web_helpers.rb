def sign_up
  visit '/users/new'
  fill_in(:email, with: 'username@gmail.com')
  fill_in(:password, with: 'password')
  click_button 'Create account'
end
