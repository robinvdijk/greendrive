require 'spec_helper'

describe "Users" do
  it "creates user", :js => true do
    visit root_path
    fill_in "Voornaam",               with: "karel"
    fill_in "Achternaam",             with: "karel"
    fill_in "E-mail",                 with: "karel@karel.nl"
    fill_in "Gebruikersnaam",         with: "karel"
    fill_in "Kenteken",               with: "81-TRR-8"
    fill_in "Wachtwoord *",           with: "Karel123!"
    fill_in "Wachtwoord verificatie", with: "Karel123!"
    click_button "Account aanmaken" 
    page.should have_content "Signed up"
  end
end
