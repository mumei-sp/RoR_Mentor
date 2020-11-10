require "application_system_test_case"

class MenteesTest < ApplicationSystemTestCase
  setup do
    @mentee = mentees(:one)
  end

  test "visiting the index" do
    visit mentees_url
    assert_selector "h1", text: "Mentees"
  end

  test "creating a Mentee" do
    visit mentees_url
    click_on "New Mentee"

    fill_in "Dept", with: @mentee.dept
    fill_in "Marks", with: @mentee.marks
    fill_in "Name", with: @mentee.name
    fill_in "Vtu", with: @mentee.vtu
    click_on "Create Mentee"

    assert_text "Mentee was successfully created"
    click_on "Back"
  end

  test "updating a Mentee" do
    visit mentees_url
    click_on "Edit", match: :first

    fill_in "Dept", with: @mentee.dept
    fill_in "Marks", with: @mentee.marks
    fill_in "Name", with: @mentee.name
    fill_in "Vtu", with: @mentee.vtu
    click_on "Update Mentee"

    assert_text "Mentee was successfully updated"
    click_on "Back"
  end

  test "destroying a Mentee" do
    visit mentees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mentee was successfully destroyed"
  end
end
