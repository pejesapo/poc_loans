module Data_Access

  def self.load
    begin
      @@data = YAML.load_file("#{Dir.pwd}/config/data/existing_users.yml")
      true
    rescue
      puts 'There is no data file for this feature'
      false
    end
  end

  def self.get_user(user_name)
    @@data['users'].select { |user| "#{user['first_name']} #{user['last_name']}" == user_name }.first
  end

end