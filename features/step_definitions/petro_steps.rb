
Given /^the blog is set up$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'admin',
                :password => 'aaaaaaaa',
                :email => 'joe@snow.com',
                :profile_id => 1,
                :name => 'admin',
                :state => 'active'})
  User.create!({:login => 'petran',
		:password => 'tirinini',
		:email => 'petros@snow.com', 
		:profile_id => 2,
		:name => 'user', 
		:state => 'active'})
end

And /^I am logged into the user panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'petran'
  fill_in 'user_password', :with => 'tirinini'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /^I am logged into the admin panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
