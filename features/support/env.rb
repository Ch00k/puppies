require 'rspec-expectations'
require 'page-object'
require 'require_all'
require 'factory_girl'


World(PageObject::PageFactory)
World(FactoryGirl::Syntax::Methods)

require_rel 'pages'
PageObject::PageFactory.routes = {
    :default => [[HomePage, :select_puppy],
                 [DetailsPage, :add_to_cart],
                 [ShoppingCartPage, :proceed_to_checkout],
                 [CheckoutPage, :checkout]],
}