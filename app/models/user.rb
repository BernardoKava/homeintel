class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include Gravtastic
  gravtastic

  has_many :saving_recons
  has_many :cashflow_recons
  has_many :resources
  has_many :rent_managements
  has_many :service_providers
  has_many :rules
  has_many :loan_registrations
  has_many :loan_managements
  has_many :issue_managements
end
