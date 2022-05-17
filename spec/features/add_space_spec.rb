feature 'add space' do
  scenario 'user can create a space' do
    visit '/spaces/new'
    fill_in 'name', with: 'Testname'
    fill_in 'description', with: 'Testdescription'
    fill_in 'price', with: 4
    click_button 'Create Space'
    expect(page).to have_content 'Thank you for adding Testname to Chuckle Hotel'
  end
end
