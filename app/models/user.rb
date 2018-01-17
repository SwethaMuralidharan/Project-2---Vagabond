class User < ApplicationRecord

  validates :firstname,presence: true
  validates :lastname,presence: true
  validates :current_city,presence: true
  validates :email,presence: true,length:{ maximum: 255 },uniqueness: true,format:{ with: /@/, message:"must include @" }
  validates :password_digest,presence: true

  has_many :posts,dependent: :destroy
  has_many :cities,through: :posts
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_secure_password
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
