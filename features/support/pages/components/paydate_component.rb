class Paydate_Component
  include PageObject

  ROOT_ELEMENT_LOCATOR ||= "//div[contains(@id,'fecha-')]"

  element(:paydate, :span, :xpath => "./span")

  def get_paydate
    paydate_element.when_present(5).text
  end

  def choose_paydate
    paydate_element.when_present(30).click
  end

end