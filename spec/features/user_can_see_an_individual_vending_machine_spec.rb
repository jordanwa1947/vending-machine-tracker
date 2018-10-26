require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
    snack_1 = dons.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("White Castle Burger: $3.50")
    expect(page).to have_content("Flaming Hot Cheetos: $2.50")
    expect(page).to have_content("Average Price: $2.50")
  end
end
