require 'rails_helper'

RSpec.describe "user sign up", type: :system do
  before do
    create(:lesson)
    create(:path, title: 'Foundations', default_path: true)
  end

  it "signs up successfully" do
    visit root_path
    find(:test_id, 'sign_up').click
    find(:test_id, 'username_field').fill_in(with: 'codesquad64')
    find(:test_id, 'email_field').fill_in(with: 'codesquad64@gmail.com')
    find(:test_id, 'password_field').fill_in(with: 'partyparrot128')
    find(:test_id, 'password_confirmation_field').fill_in(with: 'partyparrot128')
    # find(:test_id, 'submit_btn').click
  end
end
