require "rails_helper"

RSpec.describe "ingredient index" do
  describe "User Story 1 - Ingredients Index

  As a visitor,
  When I visit '/ingredients'
  I see a list of all the ingredients including their name and cost
  (e.g. Ground Beef: 2
    Salt: 4)" do
    it "get Index" do
      #arrange
      ingredient_1 = Ingredient.create(name:"Ground Beef", cost:2)
      ingredient_2 = Ingredient.create(name:"Salt", cost:4)
      ingredient_2 = Ingredient.create(name:"Apple", cost:4)
      #act
      visit "/ingredients"
      #assert
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_1.cost)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_2.cost)
    end
  end

  describe "Extention 1 - Sort Alhabetically

  As a visitor,
  When I visit '/ingredients'
  Then I see that the list of ingredients is sorted alphabetically by name" do
    it "get Index" do
      #arrange
      ingredient_1 = Ingredient.create(name:"Ground Beef", cost:2)
      ingredient_2 = Ingredient.create(name:"Salt", cost:4)
      ingredient_2 = Ingredient.create(name:"Apple", cost:4)
      #act
      visit "/ingredients"
      #assert
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_1.cost)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_2.cost)
      expect("Apple").to appear_before("Salt")
    end
  end
end