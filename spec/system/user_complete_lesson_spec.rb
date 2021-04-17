require 'rails_helper'

RSpec.describe "user completes a lesson", type: :system do

  it "completes a lesson" do
    sign_in(create(:user))
    path = create(:path)
    course = create(:course, path: path)
    section = create(:section, course: course)
    lesson = create(:lesson, section: section)
    visit path_course_lesson_path(path, course, lesson)
    # find(:test_id, 'complete_btn').click
    # expect(find(:test_id, 'incomplete_btn')).not_to be nil
  end

end