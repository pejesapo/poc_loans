class Account_Page
  include PageObject

  select(:account, :id => 'nrocuenta')

  button(:confirm, :xpath => '//button')

  def loaded?
    sleep 2
    true
  end

  def get_plan
    plan_element.when_present(30).text.gsub "\nCambiar", ''
  end

  def get_amount
    amount_element.when_present(30).text.gsub "Monto del préstamo\n", ''
  end

  def get_monthly_fee
    monthly_fee_element.when_present(30).text.gsub "Cuota mensual\n", ''
  end

  def get_number_of_fees
    number_of_fees_element.when_present(30).text.gsub "Nro. cuotas\n",''
  end

  def get_rate
    rate_element.when_present(30).text.gsub "TCEA\n", ''
  end

  def get_paydate
    paydate_element.when_present(30).text.gsub "Fecha pago\n", ''
  end


  def submit
    continue_element.when_present(30).click
  end

  def get_loandata
    loandata = []
    loandata.push({'plan' => get_plan,
                   'amount' => get_amount,
                   'monthly_fee' => get_monthly_fee,
                   'number_of_fees' => get_number_of_fees,
                   'rate' => get_rate,
                   'paydate' => get_paydate
                  })
    loandata
  end

end