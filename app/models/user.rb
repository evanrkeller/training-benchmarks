class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :track
  has_many :bmarks, through: :track
  has_many :sign_offs

  def completed_benchmarks
    sign_offs.map(&:bmark)
  end
end
