require_relative '../../../features/support/pages/components/plan_component'

class Available_Plans_Page
  include PageObject

  page_sections(:available_plans_components, Plan_Component, :xpath => Plan_Component::ROOT_ELEMENT_LOCATOR)

# Page services

  def loaded?
    sleep 2
    true
  end

  def get_available_plans
    available_plans_list = []
    available_plans_components.each do |available_plan|
      available_plans_list.push({'monthly_fee' => available_plan.get_monthly_fee,
                                 'number_of_fees' => available_plan.get_number_of_fees,
                                 'rate' => available_plan.get_rate,
                                 'total_interest' => available_plan.get_total_interest})
    end
    available_plans_list
  end

  def choose_plan(plan)
    #chooseloan_element.when_present(30).click
    available_plans_components.each do |available_plan|
      if available_plan.get_plan_number==plan
        available_plan.choose_plan
        break
      end
    end
    #sleep 30
  end

end