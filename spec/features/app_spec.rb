# feature "show all the hardcoded bookmarks" do
#   scenario 'display bookmarks' do
#     visit '/bookmarks'
#     expect(page).to have_content("Makers Academy")
#   end
# end

feature "create a new bookmark" do
  scenario 'add a new bookmark with valid url and display bookmarks' do
    visit '/bookmarks/new'
    fill_in('url', :with => 'http://instagram.com')
    fill_in('title', :with => 'Instagram')
    find_button('Submit').click
    expect(page).to have_content('Instagram')
  end

  scenario 'add a new bookmark with unvalid url' do
    visit '/bookmarks/new'
    fill_in('url', :with => 'unvalid url')
    find_button('Submit').click
    expect(page).not_to have_content('unvalid url')
    expect(page).to have_content('You must submit a valid URL')
  end

  scenario 'add a title and display' do
    visit '/bookmarks/new'
    expect(page).to have_field('title')
  end

  scenario 'user cannot add a duplicate bookmark' do
    visit '/bookmarks/new'
    fill_in('url', :with => 'http://instagram.com')
    fill_in('title', :with => 'Instagram')
    find_button('Submit').click
    find_button('Creat New Bookmarks').click
    fill_in('url', :with => 'http://instagram.com')
    fill_in('title', :with => 'Instagram')
    find_button('Submit').click
    expect(page).to have_content('This bookmark has already been added')


  end

end
