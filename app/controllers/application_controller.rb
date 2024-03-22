class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:player_id]
      Current.player = Player.find_by(id: session[:player_id])
    end
  end

  def authenticate_player!
    unless Current.player
      redirect_to root_path, notice: 'Faça o login para acessar seu usuário!'
    end
  end
end