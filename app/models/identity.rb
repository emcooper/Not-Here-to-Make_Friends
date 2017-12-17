class Identity < ApplicationRecord
  belongs_to :user, optional: :true
  validates_presence_of :uid, :provider

  def self.find_with_omniauth(auth)
    find_by(uid: auth['uid'], provider: auth['provider'])
  end

  def self.create_with_omniauth(auth)
    user = User.find_by(email: auth[:info][:email])
    create(uid: auth['uid'], provider: auth['provider'], user: user)
  end

end
