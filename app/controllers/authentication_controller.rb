class AuthenticationController < ApplicationController
  def index
    if Current.player
      redirect_to player_url
    end
  end

  def sign_in
  end

  def login
    @player = Player.find_by(username: auth_params[:username])

    if @player && @player.authenticate(auth_params[:password])
      session[:player_id] = @player.id
      redirect_to root_path
    else
      redirect_to authentication_sign_in_path, notice: 'Username ou Password incorretos!'
    end
  end

  def sign_up
  end

  def create
    @player = Player.new(auth_params)

    if @player.save
      redirect_to root_path, notice: 'Cadastro Realizado!'
    else
      render :sign_up, notice: 'Erro ao cadastrar!'
    end
  end

  def logout
    session[:player_id] = nil
    redirect_to root_path
  end

  private
  def auth_params
    params.require(:auth).permit(:username, :password)
  end

end
