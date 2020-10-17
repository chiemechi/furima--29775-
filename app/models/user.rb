class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]
        
         
         validates :email, uniqueness: true, format: { with: /@/ }
         
         validates :password, presence: true, length: { minimum: 6 }
         validates :password_confirmation, presence: true
         
         validates  :birth_day, presence: true
         validates  :nickname, presence: true
         
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
          validates :first_name
          validates :last_name
        end
        
        has_many :item
        
        with_options presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/ } do
          validates :first_name_kana
          validates :last_name_kana
        end
        
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
        
        has_many :orders
        
        has_many :sns_credentials
        
        def self.from_omniauth(auth)
          sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
          # sns認証したことがあればアソシエーションで取得
          # 無ければemailでユーザー検索して取得orビルド(保存はしない)
          user = User.where(email: auth.info.email).first_or_initialize(
            nickname: auth.info.name,
              email: auth.info.email
          )
          if user.persisted?
            sns.user = user
            sns.save
          end
          { user: user, sns: sns }
        end
         
      end
      

