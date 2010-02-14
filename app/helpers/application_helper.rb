# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 
  # 血液型
  def blood(a)
    case a
    when 1
      "A"
    when 2
      "B"
    when 3
      "O"
    when 4
      "AB"
    else
      "その他"
    end    
  end

  # 性別
  def sex(a)
    case a
    when 1
      "男"
    when 2
      "女"
    else
      "その他"
    end    
  end

  # ステータス
  def status(a)
    case a
    when 0
      "未設定"
    when 1
      "安否不明"
    when 2
      "大ケガ"
    when 3
      "閉じ込め"
    when 4
      "意識不明"
    else # 99
      "不明"
    end    
  end
  
## ステータス
#  def status(a)
#    case a
#    when 0
#      "未設定"
#    when 1
#      "避難済み"
#    when 2
#      "避難中"
#    when 3
#      "ヘルプ"
#    when 4
#      "救助活動中"
#    else # 99
#      "不明"
#    end    
#  end

  # 立場
  def position(a)
    case a
    when 0
      "未設定"
    when 1
      "救助者"
    when 2
      "非救助者"
    else  # 3
      "その他"
    end    
  end


end
