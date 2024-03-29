class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

has_many :wikis, dependent: :destroy

has_many :collaborators
has_many :collab_wikis, through: :collaborators, :source => :wiki

after_initialize :init

def init
  self.role ||= 'standard'
end

def admin?
  role == 'admin'
end

def standard?
  role == 'standard'
end

def premimum?
  role == 'premium'
end

         
end
