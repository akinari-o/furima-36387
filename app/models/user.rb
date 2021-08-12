class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #ユーザー情報
         validates :nickname, presence: true
         #パスワードは英数字混合が必須
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' 


        #本人確認情報
        #入力が必須、かつ全角（漢字・ひらがな・カタカナ）での入力が必須であること。
        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
          validates :first_name
          validates :last_name
        end
        #入力が必須、かつ全角（カタカナ）での入力が必須であること。
          with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' } do
            validates :first_name_kana
            validates :last_name_kana 
        end
        validates :birthday, presence: true
end
