class Order < ActiveRecord::Base
  enum status: [ :active, :abandoned, :completed ]
end
