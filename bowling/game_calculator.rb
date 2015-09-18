require_relative 'input_parser'

class GameCalculator
  def calculate(scorecard)
    frames = InputParser.new.parse(scorecard)
    frames.each_with_index do |frame, i|
      if i > 9
        frame.score = 0
      elsif frame.strike?
        num_throws = 0
        score = 10
        j = i + 1
        while num_throws < 2 do
          next_frame = frames[j]
          score += next_frame.first_score + next_frame.second_score
          num_throws += next_frame.num_throws
          j = j + 1
        end
        frame.score = score
      elsif frame.spare?
        next_frame = frames[i+1]
        frame.score = 10 + next_frame.first_score
      else
        frame.score = frame.first_score + frame.second_score
      end
    end
    frames.map(&:score).inject(0, &:+)
  end
end
