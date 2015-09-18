require_relative 'input_parser'

class GameCalculator
  def calculate(scorecard)
    frames = InputParser.new.parse(scorecard)
    frames.each_with_index do |frame, i|
      if i > 9
        #bonus frame
        frame.score = 0
      elsif frame.strike?
        score = 10
        next_frame = frames[i + 1]
        if next_frame.strike?
          next_next_frame = frames[i + 2]
          score += next_frame.first_score + next_next_frame.first_score
        else
          score += next_frame.first_score + next_frame.second_score
        end
        frame.score = score
      elsif frame.spare?
        next_frame = frames[i+1]
        frame.score = 10 + next_frame.first_score
      else
        frame.score = frame.first_score + frame.second_score
      end
    end
    frames.map(&:score).reduce(0, &:+)
  end
end
