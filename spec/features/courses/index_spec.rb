require 'rails_helper'

RSpec.describe "courses index page", type: :feature do
  context "as a visitor" do
    it "can see all courses with the number of students enrolled" do
      student1 = Student.create!(name: "Matt", age: 30, house: "Ravenclaw")
      student2 = Student.create!(name: "Meghan", age: 23, house: "Slytherin")

      course1 = Course.create!(name: "Defense Against the Dark Arts")
      course2 = Course.create!(name: "Potions")

      studentcourses1 = StudentCourse.create!(course_id: course1.id, student_id: student1.id)
      studentcourses2 = StudentCourse.create!(course_id: course2.id, student_id: student1.id)
      studentcourses3 = StudentCourse.create!(course_id: course1.id, student_id: student2.id)
      # studentcourses4 = StudentCourse.create!(course_id: course2.id, student_id: student2.id)

      visit '/courses'

      expect(page).to have_content("#{course1.name}: 2")
      expect(page).to have_content("#{course2.name}: 1")
    end
  end
end
