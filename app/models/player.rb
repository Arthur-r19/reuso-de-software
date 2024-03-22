class Player < ApplicationRecord

  def authenticate(pass)
    return unless password == pass
    true
  end

end
