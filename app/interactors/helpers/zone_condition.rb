module Helpers::ZoneCondition

  def progress_less_then_30_case
    case
    when @expended_hours < @green_zone
      response = condition_report(:green_report_default)

    when @expended_hours >= @green_zone && @expended_hours < @yellow_zone
      response = condition_report(:yellow_report_default)

    when @expended_hours >= @yellow_zone && @expended_hours < @red_zone
      response = condition_report(:red_report_default)

    when @expended_hours >= @red_zone && @expended_hours < @total_hours
      response = condition_report(:red_report_critic)

    when @expended_hours >= @total_hours
      response = condition_report(:overdue_task)
    end
  end

  def progress_30_50_case
    case
    when @expended_hours < @green_zone
      response = condition_report(:green_report_default)

    when @expended_hours >= @green_zone && @expended_hours < @yellow_zone
      response = condition_report(:yellow_report_default)

    when @expended_hours >= @yellow_zone && @expended_hours < @red_zone
      response = condition_report(:yellow_report_default)

    when @expended_hours >= @red_zone && @expended_hours < @total_hours
      response = condition_report(:red_report_default)

      when @expended_hours >= @total_hours
        response = condition_report(:overdue_task)
    end
  end

  def progress_50_75_case
    case
    when @expended_hours < @green_zone
      response = condition_report(:green_report_default)

    when @expended_hours >= @green_zone && @expended_hours < @yellow_zone
      response = condition_report(:green_report_default)

    when @expended_hours >= @yellow_zone && @expended_hours < @red_zone
      response = condition_report(:yellow_report_default)

    when @expended_hours >= @red_zone && @expended_hours < @total_hours
      response = condition_report(:red_report_default)

    when @expended_hours >= @total_hours
      response = condition_report(:overdue_task)
    end
  end

  def progress_more_then_75_case
    case
    when @expended_hours < @green_zone
      response = condition_report(:green_report_default)

    when @expended_hours >= @green_zone && @expended_hours < @yellow_zone
      response = condition_report(:green_report_default)

    when @expended_hours >= @yellow_zone && @expended_hours < @red_zone
      response = condition_report(:yellow_report_default)

    when @expended_hours >= @red_zone && @expended_hours < @total_hours
      response = condition_report(:red_report_default)
  
    when @expended_hours >= @total_hours
      response = condition_report(:overdue_task)
    end
  end

  def progress_completed
    return :completed
  end

  private

  def condition_report(report_param)
    case report_param
    when :green_report_default
      report = "Você aparentemente está no começo. Mantenha o foco e continue o bom trabalho!"
      zone = :green_zone
    when :yellow_report_default
      report = "Seu progresso está em #{@progress}% e você se aproxima da metade do prazo. Que tal buscar um direcionamento pontual?"
      zone = :yellow_zone
    when :red_report_default
      report = "Seu progresso está em #{@progress}% e já se passou metade do prazo. Busque um direcionamento mais objetivo com um colega."
      zone = :red_zone
    when :red_report_critic
      report = "Seu progresso está em #{@progress}% e faltam apenas #{@hours_remaining} horas para acabar o tempo estimado da tarefa. As chances de dela atrasar são altísismas. Busque ajuda. AGORA!"
      zone = :red_zone
    when :overdue_task
      report = "Sua task está atrasada. Busque a melhor solução junto ao Tech Lead para mitigar o máximo possível do atraso."
      zone = :red_zone
    end

    response = {
      zone: zone,
      hours_remaining: @hours_remaining,
      report: report
    }
  end
end