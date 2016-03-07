class User < ActiveRecord::Base
  include Clearance::User

  enum role: [:customer, :admin]
end
