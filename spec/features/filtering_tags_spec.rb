feature 'filter links by tags' do

  before :all do
    add_link
    add_link(title: 'bubble link', url: 'www.bubble.com', tags: 'bubbles')
  end

  scenario 'user visits tags/bubbles' do
    visit '/tags/bubbles'
    expect(page).to have_content 'bubble link'
    expect(page).not_to have_content 'Makers Academy'
  end
end
