describe 'Registration' do
	it 'Get/Post users/sign_up' do
		visit new_user_registration_path
		within("form[@id='new_user']") do
      fill_in 'user_email', :with => 'test@test.com'
      fill_in 'user_nickname', :with => 'test'
      fill_in 'user_password', :with => 'password'
      fill_in 'user_password_confirmation', :with => 'password'
    end
    click_button 'Sign up'
    page.should have_content 'Welcome! You have signed up successfully.'
    user = User.first
    user.email.should == 'test@test.com'
    user.nickname.should == 'test'
	end
end