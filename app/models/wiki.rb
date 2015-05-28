class Wiki < ActiveRecord::Base
  
  belongs_to :user

  has_many :collaborators
  has_many :collab_users, through: :collaborators, :source => :user

  default_scope { order('created_at DESC')}

  scope :public_wikis, -> {where(private: false) }
  scope :private_wikis, -> {where(private: true) }

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

end
