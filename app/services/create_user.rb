class CreateUser
  attr_reader :user

  def initialize(initial_params)
    @user = User.new(initial_params)
  end

  def call
    return user unless user.save
    user
  end
end
