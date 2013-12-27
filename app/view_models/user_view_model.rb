class UserViewModel < ApplicationViewModel
  def gender
    super ? 'M' : 'F'
  end
end
