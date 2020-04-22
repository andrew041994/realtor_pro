class User < ApplicationRecord
   
   has_many :user_clients
  belongs_to :company
  has_many :clients, through: :user_clients
  has_many :properties, through: :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

   def self.create_from_provider_data(provider_data)
    
      where(provider: provider_data.provider, uid: provider_data.uid).first_or_create.tap do |user|
         user.email = provider_data.info.email
         user.username = provider_data.info.name
         user.company_id = Company.find_by(name: "Default").id if user.company_id.nil?
         user.password = Devise.friendly_token[0, 20]
         user.save
      end
      
   end

end
