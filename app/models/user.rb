class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         validates :email, uniqueness: true,format: { with: /@/, message: '全角文字を使用してください' } 

         validates  :password,presence: true, length: { minimum:6}
         
         PASSWORD_REGEX  = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
         


         validates  :birthday, presence: true
        

         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
          validates :first_name
          validates :last_name
        end

        with_options presence: true, format: {with:/\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/,message: '全角カタカナを使用してください'}do
          validates :first_name_kana
          validates :last_name_kana
        end




end