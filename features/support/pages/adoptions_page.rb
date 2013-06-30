require_relative 'notice_panel'


class AdoptionsPage
  include PageObject
  include NoticePanel

  def process_first_puppy
    button_element(:value => 'Process Puppy').click
  end
end