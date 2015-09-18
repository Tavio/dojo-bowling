require_relative 'frame'

class InputParser
  def parse(input)
    first = second = nil
    frames = input.split("").each_with_object([]) do |c, frames|
      case c
      when 'X'
        frames << Frame.new('X',nil)
        first = second = nil
      when '/'
        frames << Frame.new(first, '/')
        first = second = nil
      when '-'
        if first.nil?
          first = '-'
        else
          second = '-'
          frames << Frame.new(first, second)
          first = second = nil
        end
      else
        if first.nil?
          first = c
        else
          second = c
          frames << Frame.new(first, second)
          first = second = nil
        end
      end
    end
    if !first.nil?
      frames << Frame.new(first, nil)
    end
    frames
  end
end
