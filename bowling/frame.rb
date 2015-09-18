class Frame

  attr_accessor :score

  def initialize(first, second)
    @first = first
    @second = second
    @score = 0
  end

  def strike?
    @first == 'X'
  end

  def spare?
    @second == '/'
  end

  def num_throws
    return 1 if strike?
    return 2
  end

  def first_score
    return 10 if strike?
    return 0 if @first == '-'
    return @first.to_i
  end

  def second_score
    return 0 if strike? || @second == '-'
    return 10 - first_score if spare?
    return @second.to_i
  end

end
