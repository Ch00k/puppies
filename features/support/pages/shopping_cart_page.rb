class ShoppingCartPage
  include PageObject

  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  ITEM_NUM_OF_ROWS = 6

  button(:proceed_to_checkout, :value => "Complete the Adoption")
  button(:continue_shopping, :value => "Adopt Another Puppy")
  table(:cart, :index => 0)
  cell(:cart_total, :class => "total_cell")

  def name_for_line_item(line_item)
    table_value(line_item, NAME_COLUMN)
  end

  def subtotal_for_line_item(line_item)
    table_value(line_item, SUBTOTAL_COLUMN)
  end

  private
  def table_value(line_item, column)
    row = (line_item.to_i - 1) * ITEM_NUM_OF_ROWS
    cart_element[row][column].text
  end
end