class AdminLoginPage
  include PageObject
  include DataMagic

  text_field(:username, :id => 'name')
  text_field(:password, :id => 'password')
  button(:login, :value => 'Login')

  def do_login(data = {})
    populate_page_with data_for(:admin_login_page, data)
    login
  end
end