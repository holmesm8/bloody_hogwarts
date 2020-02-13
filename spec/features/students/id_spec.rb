require 'rails_helper'

RSpec.describe "students id page", type: :feature do
  context "as a visitor" do
    it "can see a list of the student's courses" do
      student1 = Student.create!(name: "Matt", age: 30, house: "Ravenclaw")
      course1 = student1.courses.create!(name: "Defense Against the Dark Arts")

      visit "/students/#{student1.id}"

      expect(page).to have_content(course1.name)
    end
  end
end
