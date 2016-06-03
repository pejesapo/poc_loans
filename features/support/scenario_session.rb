class Scenario_Session

  attr_accessor :start_date_time

  def user
    @user ? @user : nil
  end

  def user=(user_name)
    @user = Data_Access::get_user(user_name)
  end

end