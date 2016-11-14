class Player

  attr_reader :points
  attr_reader :high_card



  def initialize(playerNum, hand)
    @playerNum = playerNum
    @hand = hand
    puts "Player #{@playerNum} hand: #{@hand}"
    @points = self.findPoints
  end

  def getHighCard
  end

  # points are assigned as follows
  # 1 High Card
  # 2 One Pair
  # 3 Two Pairs
  # 4 Three of a Kind
  # 5 Straight
  # 6 Flush
  # 7 Full House
  # 8 Four of a Kind
  # 9 Straight Flush
  # 10 Royal Flush
  #


  def findPoints
    #test royal flush
    if (self.isFlush && self.isStraight && self.getDigits[-1,1] == "A")
      return 10
    #straight flush
    elsif(self.isFlush && self.isStraight)
      return 9
    # four of a kind
    elsif (self.hasRecurringDigit(@hand, 4))
      return 8
    else
      #test for full house
      @hand.sort
      firstThree = @hand[0,3]
      firstTwo = @hand[0,2]
      secondThree = @hand[-3,3]
      secondTwo = @hand[-2,2]
      if ( (self.hasRecurringDigit(firstTwo, 2) && self.hasRecurringDigit(secondThree, 3)) ||
          (self.hasRecurringDigit(firstThree, 2) && self.hasRecurringDigit(secondTwo, 3)) )
        return 7
      end
    end

    # flush
    if (self.isFlush)
      return 6
    #straight
    elsif (self.isStraight)
      return 5
    # three of a kind
    elsif (self.hasRecurringDigit(@hand,3))
      return 5
    end
    return 0
  end


  def isFlush
    suit = ""
    for card in @hand
      currSuit = card[-1,1]
      puts currSuit
      if !suit.empty? && currSuit != suit
        return false
      end
      suit = currSuit
    end
    return true
  end

  def isStraight
    testString = "2345678910JQKA"
    handString = getDigits
    puts "handString: #{handString}"
    if testString.include? handString
      return true
    end
    return false
  end

  def hasRecurringDigit(inputArray, recurNum)
      foundRepeats = 0
      inputArray.sort
      prevCard = ""
      for card in inputArray
        if (!prevCard.empty? && card == prevCard)
          foundRepeats += 1
        end
      end
      foundRepeats == recurNum
  end

  def getDigits
    digitsArray = []
    for card in @hand
      digitsArray.push(card[0..-2])
    end
    digitsArray.sort!
    digitsArray.join
  end
end