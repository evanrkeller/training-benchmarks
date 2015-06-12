class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :track
  has_many :bmarks, through: :track
  has_many :feedbacks, dependent: :destroy
  has_many :sign_offs, dependent: :destroy
  has_and_belongs_to_many :practices
  validates :first_name, :last_name, :phone, presence: true

  def completed_benchmarks
    sign_offs.map(&:bmark)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
