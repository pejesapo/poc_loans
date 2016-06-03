class Plan_Component
  include PageObject

  ROOT_ELEMENT_LOCATOR ||= "//div[@class='cuadro']/div[contains(@id,'plan_')]"

  element(:monthly_fee, :p, :xpath => ".//p[contains(@id,'cuota_')]")
  element(:number_of_fees, :p, :xpath => ".//p[contains(@id,'nro_cuotas_')]")
  element(:rate, :p, :xpath => ".//p[contains(@id,'tasa_')]")
  element(:total_interest, :p, :xpath => ".//p[contains(@id,'intereses_')]")


  def get_monthly_fee
    monthly_fee_element.when_present(30).text
  end

  def get_number_of_fees
    number_of_fees_element.when_present(30).text
  end

  def get_rate
    rate_element.when_present(30).text
  end

  def get_total_interest
    total_interest_element.when_present(30).text
  end

end