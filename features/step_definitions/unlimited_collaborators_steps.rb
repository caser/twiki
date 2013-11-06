Given(/^I try and add (\d+) collaborators to my wiki$/) do |arg1|
  edit_wiki(@title)
  (2..1001).each do |i|
    click_button('+')
    collaborator = i + "@mail.me"
    form_id = "collaborator" + (i-1).to_s
    fill_in(form_id, :with => collaborator)
  end
end