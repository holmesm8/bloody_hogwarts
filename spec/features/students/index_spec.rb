require 'rails_helper'

RSpec.describe "on student index page", type: :feature do
  context "as a visitor" do
    it "can list all students with their courses" do
      @student1 = Student.create!(name: "Matt", age: 30, house: "Ravenclaw")
      @student2 = Student.create!(name: "Meghan", age: 20, house: "Ravenclaw")
      @course1 = @student1.courses.create!(name: "Defense against Dark Arts")

      visit "/students"
      expect(page).to have_content(@student1.name)
      expect(page).to have_content(@student2.name)
      expect(page).to have_content(@student1.age)
      expect(page).to have_content(@student2.age)
      expect(page).to have_content(@student1.house)
      expect(page).to have_content(@student2.house)
      expect(page).to have_content("Average Student Age: 25")
    end
  end
end
