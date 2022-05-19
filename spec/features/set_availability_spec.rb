# feature "update availability" do
#   scenario "host can update availability for a space" do
#     Space.create(name: 'name', description: 'description', price: 4)
#     visit('/host/spaces')

#     find(:select).find(:spaces, "name").select_option
#     fill_in :available_from, with: '2022-05-25'
#     fill_in :available_to, with: '2022-06-10'

#     click_button "Update Availability"

#     # expect(page).to eq()

#   end
# end