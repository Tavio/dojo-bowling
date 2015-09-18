require_relative '../../bowling/game_calculator'

describe GameCalculator do
  
  subject { GameCalculator.new }
  
  describe '#calculate' do
    it 'calculates the score for a perfect game correctly' do
      subject.calculate("XXXXXXXXXXXX").should == 300
    end

    it 'calculates the score for a game without spare nor strikes correctly' do
      subject.calculate('12345123451234512345').should == 60
    end

    it 'calculates the score for the heartbreak game correctly' do
      subject.calculate('9-9-9-9-9-9-9-9-9-9-').should == 90
    end

    it 'calculates the score for a game with spares on every round correctly' do
      subject.calculate('5/5/5/5/5/5/5/5/5/5/5').should == 150
    end
    
    it 'calculates the correct score for this game that I found on the internet' do
      subject.calculate("X9/5/72XXX9-8/9/X").should == 187
    end

    it 'calculates the correct score for this other game that I found on the internet' do
      subject.calculate("63718/72X627/X8-7/X").should == 135
    end
  end
end
