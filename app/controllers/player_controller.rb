require 'net/http'

class PlayerController < ApplicationController
  before_action :authenticate_player!
  def index
    @player = Current.player
  end

  def study
    @player = Current.player

    uri = URI('http://localhost:3000/study')
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      body = JSON.parse(res.body).with_indifferent_access

      @player.update(knowledge: @player.knowledge+ body[:knowledge],
                     sanity: @player.sanity + body[:sanity])
      redirect_to player_path, notice: body[:notice]
    else
      redirect_to player_path, notice: 'Algo deu errado!'
    end
  end

  def challenge
    @player = Current.player

    uri = URI('http://localhost:3000/challenge')
    params = { level: @player.level, knowledge: @player.knowledge }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      body = JSON.parse(res.body).with_indifferent_access
      if body[:status] == 200
        @player.update(level: @player.level + 1, sanity: @player.sanity+20)
      else
        @player.update(sanity: @player.sanity - 5)
      end
      redirect_to player_path, notice: body[:notice]
    else
      redirect_to player_path, notice: 'falha'
    end
  end
end
