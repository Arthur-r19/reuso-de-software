class ChallengeController < ApplicationController
  def challenge
    case challenge_params[:level].to_i
    when 1
      challenge_name = ['CÁLCULO 1', 'GEOMETRIA ANALÍTICA', 'PROGRAMAÇÃO 1'].shuffle.pop
      knowledge_required = 50
    when 2
      challenge_name = ['PROJETO DE SOFTWARE', 'CÁLCULO 2', 'ÁLGEBRA LINEAR'].shuffle.pop
      knowledge_required = 100
    when 3
      challenge_name = ['VARIÁVEIS COMPLEXAS', 'PROBABILIDADE E ESTATÍSTICA', 'FÍSICA 3'].shuffle.pop
      knowledge_required = 150
    when 4
      challenge_name = ['CÁLCULO 4', 'LINGUAGENS FORMAIS, AUTÔMATOS E COMPUTABILIDADE', 'PROGRAMAÇÃO 1'].shuffle.pop
      knowledge_required = 200
    when 5
      challenge_name = ['PROJETO E ANÁLISE DE ALGORITMOS', 'CIRCUITOS ELÉTRICOS', 'SINAIS E SISTEMAS'].shuffle.pop
      knowledge_required = 250
    when 6
      challenge_name = ['SISTEMAS DE CONTROLE 1', 'MÉTODOS NUMÉRICOS', 'ELETRÔNICA'].shuffle.pop
      knowledge_required = 300
    when 7
      challenge_name = ['SISTEMAS DE CONTROLE 2', 'INSTRUMENTAÇÃO ELETRÔNICA', 'MICROCONTROLADORES'].shuffle.pop
      knowledge_required = 350
    when 8
      challenge_name = ['ROBÓTICA', 'MECÂNICA DOS SÓLIDOS', 'SISTEMAS EMBARCADOS'].shuffle.pop
      knowledge_required = 400
    when 9
      challenge_name = ['ESTÁGIO OBRIGATÓRIO'].shuffle.pop
      knowledge_required = 450
    when 10
      challenge_name = ['TCC'].shuffle.pop
      knowledge_required = 500
    else
      return render json: {notice: 'Você se Formou!!!!!', status: 200}, status: :ok
    end
    if !knowledge_required.nil? && challenge_params[:knowledge].to_i >= knowledge_required
      render json: {notice: "Parabéns, você passou na matéria #{challenge_name}!", status: 200}, status: :ok
    else
      render json: {notice: "Infelizmente nem a Prova Final de salvou!", status: 400}
    end
  end

  def challenge_params
    params.permit(:level, :knowledge)
  end

end
