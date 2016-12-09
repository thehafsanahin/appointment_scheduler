class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
                    :styles => {
                        :medium => "300x300>",
                        :thumb => "150x150"
                    },
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar,
                                    :content_type => /\Aimage\/.*\Z/

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def is_patient?
    type == 'Patient'
  end

  def is_doctor?
    type == 'Doctor'
  end
end
