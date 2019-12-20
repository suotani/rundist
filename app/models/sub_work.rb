class SubWork
  attr_accessor :dist, :cal, :error_messages

  def initialize(dist, cal)
    @dist = dist.to_f
    @cal = cal.to_f
    @error_messages = []
  end

  def save(work)
    if valid
      work.dist += @dist
      work.cal += @cal
      return work.save
    end
    false
  end

  private
  
  def valid
    check_dist
    check_cal
    @error_messages.blank?
  end

  def check_dist
    unless @dist >= 0 && @dist < 1000
      @error_messages.append("距離は0以上1000未満の数値のみ入力可能です")
    end
  end

  def check_cal
    unless @dist >= 0 && @dist < 1000
      @error_messages.append("消費カロリーは0以上1000未満の数値のみ入力可能です")
    end
  end
end