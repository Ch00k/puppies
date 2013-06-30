require_relative 'side_menu_panel'


module AdminSideMenuPanel
  include PageObject
  include SideMenuPanel

  link(:adoptions, :text => "Adoptions")
  link(:puppies, :text => "Puppies")
  link(:users, :text => "Users")
  link(:logout, :text => "Logout")
end