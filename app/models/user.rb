class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,presence: true
         validates :email, uniqueness: true,format: { with: /@/ } 

         validates  :password,presence: true, length: { minimum:6}
         validates :password_confirmation, presence: true
         validates :password, confirmation: true
        
         validates  :birth_day, presence: true

           
         PASSWORD_REGEX  = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
         


        

         with_options presence: true do
          validates :first_name
          validates :last_name
         end

        with_options presence: true do
          validates :first_name_kana
          validates :last_name_kana
        end

        with_options format: {with:/\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/}, allow_nil: true do
          validates :first_name_kana
          validates :last_name_kana
        end

        with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}, allow_nil: true do
          validates :first_name
          validates :last_name
        end
end