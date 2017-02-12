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

enum PokerValue: Int{
    case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }

struct Card {
    let value: PokerValue
    let suit: PokerSuit
    init(_ value: PokerValue, _ suit: PokerSuit) {
        self.value = value
        self.suit = suit
    }
}

enum PokerHandRank: String{
    case HighCard
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
                print (hand[i].value, hand[i].suit, hand[j].value, hand[j].suit)
                print (i, j)
                if (hand[i].value, hand[i].suit) == (hand[j].value, hand[j].suit) {
                    return false
                }
            }
        }
        return true
    }
}

//class PokerHandEvaluator {
//    let cards =
//}

let card1 = Card(PokerValue.king, PokerSuit.hearts)
let card2 = Card(PokerValue.king, PokerSuit.diamonds)
let card3 = Card(PokerValue.king, PokerSuit.diamonds)
let card4 = Card(PokerValue.three, PokerSuit.spades)
let card5 = Card(PokerValue.four, PokerSuit.spades)
let pokerHand = PokerHand([card1, card2, card3, card4, card5])

print (pokerHand.isHandValid())

