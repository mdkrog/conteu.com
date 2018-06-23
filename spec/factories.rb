FactoryBot.define do
  
  factory :issue do
    title "Flight"
    issue_number "1"
    published true
    release_date Date.today
  end

  factory :user do
    email "matt@conteu.com"
    password "mypassword"
  end
end