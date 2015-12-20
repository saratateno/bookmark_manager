# As a User
# So that I can come back to websites I like
# I want to add new links to the list with their title

feature 'add links' do
  scenario 'user adds a link' do
    visit '/links/new'
    fill_in('Title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com/')
    fill_in('Tags', with: 'Bootcamp')
    click_button 'Submit'
    expect(current_path).to eq '/'
    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
    end
    expect(Link.first.tags.map(&:name)).to include 'Bootcamp'
  end
end
