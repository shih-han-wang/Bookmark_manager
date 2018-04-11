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
    fill_in('url', :with => 'http://youtube.com')
    fill_in('title', :with => 'youtube')
    find_button('Submit').click
    find_button('Creat New Bookmarks').click
    fill_in('url', :with => 'http://youtube.com')
    fill_in('title', :with => 'youtube2')
    find_button('Submit').click
    expect(page).to have_content('That bookmark has already been added, title update')

  end
end

  feature 'deleting bookmarks' do
    it 'the user is presented with a button to delete a bookmark' do
      visit '/bookmarks/new'
      fill_in('url', :with => 'http://netflix.com')
      fill_in('title', :with => 'Netflix')
      find_button('Submit').click
      expect(page).to have_button('Netflix')

    end

    it 'the user deletes a bookmark and it is no longer displayed' do
      visit '/bookmarks/new'
      fill_in('url', :with => 'http://netflix.com')
      fill_in('title', :with => 'Netflix')
      find_button('Submit').click

      find_button('Delete Netflix').click

      expect(page).not_to have_content "Netflix"
    end
  end
