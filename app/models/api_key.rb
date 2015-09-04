class ApiKey < ActiveRecord::Base

  def self.is_valid?(token, key)
    self.where(token: token, api_key: key).exists?
  end
end
