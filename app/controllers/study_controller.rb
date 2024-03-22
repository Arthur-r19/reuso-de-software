class StudyController < ApplicationController
  def study
    lucky = rand()

    if lucky > 0.95
      string_msg = 'Deu MUITA sorte, encontrou um veterano para te ajudar!'
      knowledge_gained = 20
      sanity = 5

    elsif lucky > 0.5
      string_msg = 'Deu sorte, você entendeu a revisão da matéria!'
      knowledge_gained = 10
      sanity = 0

    elsif lucky > 0.25
      string_msg = 'Vish, você estudou mas entendeu pouco!'
      knowledge_gained = 5
      sanity = -5

    else
      string_msg = 'Deu a lógica, você não entendeu NADAAA!'
      knowledge_gained = 0
      sanity = -10
    end
    render json: {notice: string_msg, knowledge: knowledge_gained, sanity: sanity}
  end

end
