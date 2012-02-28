
Given /^I have dishes named (.+)$/ do |dishes|
  dishes.split(', ').each do |dish|
    Dish.create! :name=>dish
  end
end

When /^I go to the list of dishes$/ do
  visit(dishes_path)
end

Then /^I should see (.*)$/ do |content|
  pass = page.has_content?(content)
  showpage(page) unless pass
  assert pass
end

Given /^I have mapped ([^ ]+) to the dish (.+)$/ do |code, dish|
  @code = code
  d = Dish.create! :name=>dish
  Code.create! :codepoint=>code, :dish => d
end

Given /^I have mapped ([^ ]+) to the special offer (.+)$/ do |code, offer|
  @code = code
  o = Offer.create! :name=>offer
  Code.create! :codepoint=>code, :offer => o
end

When /^I request the code$/ do 
  visit("/v1/#{@code}")
end

Then /^I should get type: (.*)$/ do |content|
  pass = page.has_content?(content)
  showpage(page) unless pass
  assert pass
end


