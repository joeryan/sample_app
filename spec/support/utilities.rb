include ApplicationHelper

def valid_signin(user)
  fill_in "Email",      with: user.email
  fill_in "Password",   with: user.password
  click_button "Sign in"
	# Sing in when not using Capybara as well.
	cookies[:remember_token] = user.remember_token
end

def sign_in(user)
	visit signin_path
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"
	# Sign in when not using Capybara as well.
	cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_correct_title do |title|
  match do |page|
    page.should have_selector 'title', text: full_title(title)
  end
end

RSpec::Matchers.define :have_correct_header do |header|
  match do |page|
    page.should have_selector 'h1', text: header
  end
end
