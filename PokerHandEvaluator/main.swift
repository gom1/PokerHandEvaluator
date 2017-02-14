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

enum PokerValue: Int {
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
    case HighCard = 1
    case OnePair
    case TwoPairs
    case ThreeOfAKind
    case Straight
    case Flush
    case FullHouse
    case FourOfAKind
    case StraightFlush
}

struct PokerHand {
    let card1: Card
    let card2: Card
    let card3: Card
    let card4: Card
    let card5: Card
    let hand: [Card]
    
    init (_ cards: [Card]) {
        self.card1 = cards[0]
        self.card2 = cards[1]
        self.card3 = cards[2]
        self.card4 = cards[3]
        self.card5 = cards[4]
        self.hand = [card1, card2, card3, card4, card5]
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
    
    func getCountByType(type: PokerValue) -> [PokerValue: Int] {
        
    }
    
    
    func getCountByType(type: PokerSuit) -> [PokerSuit: Int] {
        
    }
    
    func isFlush() -> Bool{
        
    }
}



class PokerHandEvaluator {
    
}

let card1 = Card(PokerValue.king, PokerSuit.hearts)
let card2 = Card(PokerValue.ace, PokerSuit.diamonds)
let card3 = Card(PokerValue.king, PokerSuit.diamonds)
let card4 = Card(PokerValue.three, PokerSuit.spades)
let card5 = Card(PokerValue.four, PokerSuit.spades)
let pokerHand = PokerHand([card1, card2, card3, card4, card5])

print (pokerHand.getHandCardValues())
