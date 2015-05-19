class Wiki < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC')}

  scope :public_wikis, -> {where(private: false)}
  scope :private_wikis, -> {where(private: true)}

end
