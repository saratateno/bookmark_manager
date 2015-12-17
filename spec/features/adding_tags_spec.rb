feature 'add tags' do
  scenario 'add a single tag to a link' do
    visit '/'
    click_button('Add another link')
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('tags', with: 'Bootcamp')
    click_button('Hey Presto!')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Bootcamp')
  end

  scenario 'add multiple tags' do
    visit '/links/new'
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('tags', with: 'Bootcamp, education, coding, tech')
    click_button('Hey Presto!')
    expect(current_path).to eq ('/links')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Bootcamp', 'coding')
  end
end
