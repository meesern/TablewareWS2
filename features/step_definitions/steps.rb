
Given /^I have dishes named (.+)$/ do |dishes|
  dishes.split(', ').each do |dish|
    Dish.create! :name=>dish
  end
end

Given /^I have mapped ([^ ]+) to the dish (.+)$/ do |code, dish|
  @code = code
  @url1 = 'http://www.somewhere'
  @url2 = 'http://www.somewhere-else'
  d = Dish.create! :name=>dish, :thumb=> 'rails.png', :image=>'rails.png', :url1=> @url1, :url2=> @url2
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

Given /^(.+) has encountered (.+)$/ do |person, dish|
  p = User.find_by_name(person)
  d = Dish.find_by_name(dish)
  @rating=3
  @comment="Gosh that was nice!"
  Encounter.create! :user=>p, :dish=> d, :rating=>@rating, :comment=>@comment
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

Then /^I should get ([^ ]+): (.*)$/ do |key, content|
  assert_keyval_on_page(key, content, page)
end

Then /^I should get the rating$/ do
  assert_keyval_on_page('rating', @rating, page)
end

Then /^I should get the comment$/ do
  showpage(page)
  assert_keyval_on_page('comment', @comment, page)
end


