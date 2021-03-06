class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :online, lambda{ where("updated_at > ?", 10.minutes.ago) }
  def online?
        updated_at > 10.minutes.ago
  end
end
