require_relative 'error_panel'
require_relative 'notice_panel'


class CheckoutPage
  include PageObject
  include DataMagic
  include ErrorPanel
  include NoticePanel

  text_field(:name, :id => "order_name")
  text_field(:address, :id => "order_address")
  text_field(:email, :id => "order_email")
  select_list(:payment_method, :id => "order_pay_type")
  button(:place_order, :value => "Place Order")

  def checkout(data = {})
    populate_page_with data_for(:checkout_page, data)
    place_order
  end
end