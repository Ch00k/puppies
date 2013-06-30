require_relative 'admin_side_menu_panel'


class AdminLandingPage
  include PageObject
  include AdminSideMenuPanel

  page_url('http://localhost:3000/admin')
end