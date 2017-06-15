class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = ["admin", "editor"]

  def is_admin?
    self.role == "admin"
  end

  def is_editor?
    ["admin", "editor"].include?(self.role)   #如果是 admin 的话， 当然也有editor 的权限
  end

  def display_name
    self.email.split("@").first
  end

  has_many :memberships
  has_many :groups, through: :memberships

  has_one :profile

  accepts_nested_attributes_for :profile

  has_many :registrations
end
