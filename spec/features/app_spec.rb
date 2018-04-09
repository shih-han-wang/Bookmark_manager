feature "show all the hardcoded bookmarks" do
  scenario 'display bookmarks' do
    visit '/'
    expect(page).to have_content("www.google.co.uk")
    expect(page).to have_content("www.speedhunters.com")
    expect(page).to have_content("www.facebook.com")
  end
end
