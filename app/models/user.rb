class User < ApplicationRecord
  
  # メールアドレスの⼤⽂字⼩⽂字を区別せず⼩⽂字として登録（before_saveというコールバックメソッドを使用する）。オブジェクトが保存される時点で処理を実行する。
  before_save {self.email = email.downcase}
  
  validates :name, presence: true, length: { maximum: 50 }
  
  # メールアドレスの正規表現（正規表現regex = regular expression）
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
end
