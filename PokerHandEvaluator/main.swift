//
//  main.swift
//  PokerHandEvaluator
//
//  Created by German Om on 2/9/17.
//  Copyright © 2017 German Om. All rights reserved.
//

enum PokerSuit: String {
    case hearts
    case diamonds
    case clubs
    case spades
}

enum PokerValue: Int, Comparable{
    case ace = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    
    //MARK: From Comparable
    public static func < (a: PokerValue, b: PokerValue) -> Bool {
        return a.rawValue < b.rawValue
    }
    
    public static func > (a: PokerValue, b: PokerValue) -> Bool {
        return a.rawValue > b.rawValue
    }
}

struct Card: Equatable{
    let value: PokerValue
    let suit: PokerSuit
    init(_ value: PokerValue, _ suit: PokerSuit) {
        self.value = value
        self.suit = suit
    }
    
    //MARK: From Equatable
    public static func ==(lhs: Card, rhs: Card) -> Bool {
        return (lhs.value == rhs.value) && (lhs.suit == rhs.suit)
    }
}

enum PokerHandRank: Int{
    case highCard = 1
    case onePair
    case twoPairs
    case threeOfAKind
    case straight
    case flush
    case fullHouse
    case fourOfAKind
    case straightFlush
    case royalFlush
}

enum PokerHandError: Error {
    case InvalidPokerHand
}

struct PokerHand {
    let card1: Card
    let card2: Card
    let card3: Card
    let card4: Card
    let card5: Card
    let hand: [Card]
//    let handSuitCounter: [PokerSuit:Int]
//    let handValueCounter: [PokerValue:Int]
    
    init (_ cards: [Card])  {
        self.card1 = cards[0]
        self.card2 = cards[1]
        self.card3 = cards[2]
        self.card4 = cards[3]
        self.card5 = cards[4]
        self.hand = [card1, card2, card3, card4, card5]
//        if isHandValid() == false {
//            throw PokerHandError.InvalidPokerHand
//        }
    }
    
    func isHandValid() -> Bool {
        for i in 0...hand.count - 2 {
            for j in i+1...hand.count - 1 {
                if hand[i] == hand[j] {
                    return false
                }
            }
        }
        return true
    }
    
    func getHandCardValues() -> [PokerValue] {
        var cardValues: [PokerValue] = []
        for card in 0...hand.count - 1 {
            cardValues.append(hand[card].value)
        }
        return cardValues
    }
    
    func getHandCardSuits() -> [PokerSuit] {
        var cardSuits: [PokerSuit] = []
        for card in 0...hand.count - 1 {
            cardSuits.append(hand[card].suit)
        }
        return cardSuits
    }
    
    func getValueCount(_ cardValues: [PokerValue]) -> [PokerValue: Int] {
        var counter: [PokerValue: Int] = [:]
        for value in cardValues {
            guard let count = counter[value] else {
                counter[value] = 1
                continue
            }
            counter[value] = count + 1
        }
        return counter
    }
    
    func getSuitCount(_ cardSuits: [PokerSuit]) -> [PokerSuit: Int] {
        var counter: [PokerSuit: Int] = [:]
        for suit in cardSuits {
            guard let count = counter[suit] else {
                counter[suit] = 1
                continue
            }
            counter[suit] = count + 1
        }
        return counter
    }
    
//    func isStraight() -> Bool {
//        //if
//    }
    func hasThreeOfAKind(_ handValueCounter: [PokerValue: Int]) -> Bool {
        var hasThreeOfAKind = false
        for key in handValueCounter.keys {
            print (key)
            if handValueCounter[key] == 3 {
                hasThreeOfAKind = true
            }
        }
        return hasThreeOfAKind
    }
    
    func hasPair(_ handValueCounter: [PokerValue: Int]) -> Bool {
        var hasPair = false
        for key in handValueCounter.keys {
            if handValueCounter[key] == 2 {
                hasPair = true
            }
        }
        return hasPair
    }
    
    func hasTwoPairs(_ handValueCounter: [PokerValue: Int]) -> Bool {
        var hasTwoPairs = false
        var foundFirstPair = false
        for key in handValueCounter.keys {
            if handValueCounter[key] == 2 && foundFirstPair == false {
                foundFirstPair = true
            } else if handValueCounter[key] == 2 {
                hasTwoPairs = true
            }
        }
        return hasTwoPairs
    }
    
    func isFlush(_ handSuitCounter: [PokerSuit: Int]) -> Bool {
        var isFlush = false
        if handSuitCounter.count == 1 {
            isFlush = true
        }
        return isFlush
    }
    
    func isStraight(_ handValues: [PokerValue]) -> Bool {
        var isStraight = false
        var sortedValues = handValues.sorted()
        if sortedValues[4].rawValue - sortedValues[0].rawValue == 4 || sortedValues[0].rawValue == 1 && sortedValues[4].rawValue - sortedValues[1].rawValue == 3 {
            isStraight = true
        }
        return isStraight
    }
    
    func isRoyal(_ handValues: [PokerValue]) -> Bool {
        var isRoyal = false
        var sortedValues = handValues.sorted()
        if sortedValues[0].rawValue == 1 && sortedValues[4].rawValue - sortedValues[1].rawValue == 3 {
            isRoyal = true
        }
        return isRoyal
    }
    
    func getHandRank() -> PokerHandRank {
        let handSuits = getHandCardSuits()
        let handValues = getHandCardValues()
        let handSuitCounter = getSuitCount(handSuits)
        let handValueCounter = getValueCount(handValues)
        var handRank = PokerHandRank.highCard
        let isHandStraight = isStraight(handValues)
        
        if handValueCounter.count == 2 {
            if hasThreeOfAKind(handValueCounter) && hasPair(handValueCounter) {
                handRank = PokerHandRank.fullHouse          //FULL HOUSE
            } else {
                handRank = PokerHandRank.fourOfAKind        //FOUR OF A KIND
            }
        }
        else if handValueCounter.count == 3 {
            if hasThreeOfAKind(handValueCounter) {
                handRank = PokerHandRank.threeOfAKind       //THREE OF A KIND
            }
            else if hasTwoPairs(handValueCounter) {
                handRank = PokerHandRank.twoPairs           //TWO PAIR
            }
        }
        else if handValueCounter.count == 4 {
            handRank = PokerHandRank.onePair                //ONE PAIR
        }
        else if isFlush(handSuitCounter) {
            if isHandStraight && isRoyal(handValues) {      //ROYAL FLUSH
                handRank = PokerHandRank.royalFlush
            }
            else if isHandStraight{                         //STRAIGHT FLUSH
                handRank = PokerHandRank.straightFlush
            }
            else {                                          //FLUSH
                handRank = PokerHandRank.flush
            }
        }
        else if isHandStraight{                             //STRAIGHT
            handRank = PokerHandRank.straight
        }
        else {
            handRank = PokerHandRank.highCard               //HIGH CARD
        }
        
        
        return handRank
    }
}

let card1 = Card(PokerValue.king, PokerSuit.hearts)
let card2 = Card(PokerValue.queen, PokerSuit.spades)
let card3 = Card(PokerValue.ten, PokerSuit.diamonds)
let card4 = Card(PokerValue.nine, PokerSuit.hearts)
let card5 = Card(PokerValue.jack, PokerSuit.hearts)
let pokerHand = PokerHand([card1, card2, card3, card4, card5])

let a = pokerHand.getHandCardValues()
let counter = pokerHand.getValueCount(a)
print (pokerHand.getHandRank())

