class WikiPolicy < ApplicationPolicy

def index?
  user.present? 
end

def show?
  index?
end

end