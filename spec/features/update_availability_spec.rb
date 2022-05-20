# feature "update availability" do
#   before(:each) { DatabaseConnection.setup.query("INSERT INTO users (id, username, email, password)
#     VALUES($1, $2, $3, $4);", 
#     [1, 'username', 'email', 'encrypted_pass']) }

#   scenario "host can update availability for a space" do

#     Space.create(name: 'name', description: 'description', price: 4, user_id: 1)
#     visit('/host/spaces')

#     find(:select).find(:spaces, "name").select_option
#     fill_in :available_from, with: '2022-05-25'
#     fill_in :available_to, with: '2022-06-10'

#     click_button "Update Availability"

#     expect(page).to have_content("Updated the availability of your space")
#   end
# end