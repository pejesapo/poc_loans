require_relative '../../../features/support/pages/components/paydate_component'

class Personal_Information_Page
  include PageObject

  page_sections(:paydate_components, Paydate_Component, :xpath => Paydate_Component::ROOT_ELEMENT_LOCATOR)

  text_field(:cellphone, :id => 'celular')
  text_field(:email, :id => 'email')
  text_field(:address, :id => 'direccion')
  button(:save, :xpath => '//button')


  def loaded?
    sleep 2
    true
  end

  def enter_cellphone(cellphone)
    cellphone_element.when_present(30).send_keys(cellphone)
  end

  def enter_email(email)
    email_element.when_present(30).send_keys(email)
  end

  def enter_address(address)
    address_element.when_present(30).send_keys(address)
  end

  def select_paydate(paydate)
    paydate_components.each do |paydate_iterator|
      if paydate_iterator.get_paydate==paydate
        paydate_iterator.choose_paydate
      end
    end
  end

  def submit
    save_element.when_present(30).click
  end

  def enter_values(cellphone, email, address, paydate)
    enter_cellphone(cellphone)
    enter_email(email)
    enter_address(address)
    select_paydate(paydate)
    submit
    sleep 10
  end

end