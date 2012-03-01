
Given /^I have dishes named (.+)$/ do |dishes|
  dishes.split(', ').each do |dish|
    Dish.create! :name=>dish
  end
end

Given /^I have mapped ([^ ]+) to the dish (.+)$/ do |code, dish|
  @code = code
  @url1 = 'http://www.google.com'
  d = Dish.create! :name=>dish, :thumb=> 'rails.png', :image=>'rails.png', :url1=> @url1
  Code.create! :codepoint=>code, :dish => d
end

Given /^I have mapped ([^ ]+) to the special offer (.+)$/ do |code, offer|
  @code = code
  o = Offer.create! :name=>offer
  Code.create! :codepoint=>code, :offer => o
end

Given /^(.+) is registered$/ do |person|
  @person = User.create! :name=>person, :password=>'test1234', :password_confirmation=>'test1234', :email_address=>person+'@test.com'

end

When /^I go to the list of dishes$/ do
  visit(dishes_path)
end

When /^I request the code$/ do 
  visit("/v1/#{@code}")
end

When /^I request \/(.*)$/ do |url|
  visit("/#{url}")
end

Then /^I should get a picture$/ do 
  pass = page.has_no_content?('html')
  showpage(page) unless pass
  assert pass
end

Then /^I should get a url$/ do 
  pass = page.has_content?(@url1)
  showpage(page) unless pass
  assert pass
end

Then /^I should see (.*)$/ do |content|
  pass = page.has_content?(content)
  showpage(page) unless pass
  assert pass
end

Then /^I should get type: (.*)$/ do |content|
  pass = page.has_content?(content)
  showpage(page) unless pass
  assert pass
end


