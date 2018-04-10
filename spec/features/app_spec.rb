feature "show all the hardcoded bookmarks" do
  scenario 'display bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content("http://makersacademy.com")
    expect(page).to have_content("http://google.com")
    expect(page).to have_content("http://destroyallsoftware.com")
  end
end

feature "create a new bookmark" do
  scenario 'add a new bookmark with valid url and display bookmarks' do
    visit '/bookmarks/new'
    fill_in('url', :with => 'http://instagram.com')
    find_button('Submit').click
    expect(page).to have_content('http://instagram.com')
  end

  scenario 'add a new bookmark with unvalid url' do
    visit '/bookmarks/new'
    fill_in('url', :with => 'unvalid url')
    find_button('Submit').click
    expect(page).not_to have_content('unvalid url')
    expect(page).to have_content('You must submit a valid URL')
  end

end
