class EmailSubscriber
  include ActiveModel::Model

  attr_reader :user, :email

  def self.create(email:)
    new(email: email).process
  end

  def initialize( user_model: User, email: "")
    @email = email
    @user_model = user_model
  end

  def process
    user = User.create(email: email)
    user.save!(validate: false)
    @user = user
    self
  end

  private

  attr_reader :user_model
end
