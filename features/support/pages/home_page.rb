class Home_Page
  include PageObject

  page_url 'http://www.brainhousesolutions.com/loans'

  text_field(:amount, :id => 'monto')
  select_list(:reason, :id => 'motivo')
  text_field(:dni, :id => 'dni')
  button(:continue, :xpath => '//button')

  def loaded?
    sleep 2
    true
  end

  def enter_amount(amount)
    amount_element.when_present(30).send_keys(amount)
  end

  def select_reason(reason)
    reason_element.when_present(30).select(reason)
  end

  def enter_dni(dni)
    dni_element.when_present(30).send_keys(dni)
  end

  def submit
    continue_element.when_present(30).click
  end

  def enter_values(amount, reason, dni)
    enter_amount(amount)
    select_reason(reason)
    enter_dni(dni)
    submit
  end

end