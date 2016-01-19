class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :studio
  has_many :yoga_classes
  has_many :saved_classes
  has_many :saved, through: :saved_classes, source: :yoga_class, foreign_key: "yoga_class_id"
  has_many :reviews
  belongs_to :role
end
