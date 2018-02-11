module Users
  def self.clear_data
    @default_user = nil
    @custom_user = nil
  end

  def self.default_user
    @default_user ||= User.new
    @default_user
  end

  def self.custom_user(email:, password:)
    @custom_user ||= User.new(email: email, password: password)
    @custom_user
  end
end

class User
  attr_reader :email, :password, :cookie
  def initialize(email: 'sx1234@inbox.lv', password: 'Parole123')
    @email = email
    @password = password
    @cookie = {}
  end

  def set_cookie(cookie)
    @cookie = cookie
  end
end
