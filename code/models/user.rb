# encoding: utf-8

# ref: https://gist.github.com/1039058

class User < RewindModel
  include DataMapper::Resource

  property :id, Serial
  property :password_digest, String, :length => 60, :writer => :protected, :required => true
  property :email, String, :format => :email_address, :unique => true, :required => true, :messages => {
    :format => :format,
    :presence => :presence,
    :is_unique => :is_unique
  }
  property :name, String, :unique => true,:required => true, :messages => {
    :presence => :presence,
    :is_unique => :is_unique
  }
  property :title, String
  property :bio, String
  # role_id
  property :updated_at, DateTime
  property :created_at, DateTime

  has 1, :cookie
  has 1, :avatar
  has 1, :sign
  belongs_to :role
  has n, :posts
  has n, :comments
  has n, :usertags, :through => Resource

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass) if pass
  end

  def password
    if self.password_digest
      BCrypt::Password.new(self.password_digest)
    else
      :no_password
    end
  end

  def authenticate(pass)
    password == pass
  end

  def self.authenticate(name, pass)
    un = name.to_s.downcase
    u = first(:conditions => ['lower(email) = ? OR lower(name) = ?', un, un])
    if u && u.authenticate(password)
      u
    else
      nil
    end
  end
end
