require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:user_001)
    @project = projects(:user_001)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "span", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Description", with: @project.description
    fill_in "Name", with: @project.name
    click_on "Create Project"

    assert_selector "span", text: "MyString"
  end

  test "updating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Description", with: @project.description
    fill_in "Name", with: @project.name
    click_on "Create Project"
    visit projects_url

    click_on "Edit", match: :first

    fill_in "Description", with: @project.description
    fill_in "Name", with: @project.name
    click_on "Update Project"

    assert_text "Project was successfully updated"
  end

  test "destroying a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Description", with: @project.description
    fill_in "Name", with: @project.name
    click_on "Create Project"
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
