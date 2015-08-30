class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [ :user, :site_admin, :admin, :super_admin ]

  has_many :funding_instruments

  def stripe_customer
    @stripe_customer ||= StripeCustomer.find_or_create_by(self.email)
  end

end
