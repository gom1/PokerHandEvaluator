//
//  PokerHandEvaluatorTests.swift
//  PokerHandEvaluatorTests
//
//  Created by German Om on 2/9/17.
//  Copyright © 2017 German Om. All rights reserved.
//

import XCTest
@testable import PokerHandEvaluator

class PokerHandEvaluatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAreCardsValid() {
        let card = Card(PokerValue.king, PokerSuit.hearts)
        XCTAssertEqual(card.value, PokerValue.king)
        XCTAssertEqual(card.suit, PokerSuit.hearts)
    }
    
    func testValidPokerHand() {
        // Checking Validity (No repeated cards allowed in hand)
        let card1 = Card(PokerValue.king, PokerSuit.hearts)
        let card2 = Card(PokerValue.jack, PokerSuit.hearts)
        let card3 = Card(PokerValue.ten, PokerSuit.diamonds)
        let card4 = Card(PokerValue.ten, PokerSuit.spades)
        let card5 = Card(PokerValue.four, PokerSuit.spades)
        let pokerHand = PokerHand([card1, card2, card3, card4, card5])
        XCTAssertTrue(pokerHand.isHandValid())
    }
    
    func testInvalidPokerHand() {
        // Hand with Repeated Cards
        let card1 = Card(PokerValue.king, PokerSuit.hearts)
        let card2 = Card(PokerValue.king, PokerSuit.hearts)
        let card3 = Card(PokerValue.king, PokerSuit.hearts)
        let card4 = Card(PokerValue.king, PokerSuit.hearts)
        let card5 = Card(PokerValue.king, PokerSuit.hearts)
        
        let pokerHand = PokerHand([card1, card2, card3, card4, card5])
        XCTAssertFalse(pokerHand.isHandValid())
    }
    
    func testGetCardValues() {
        let card1 = Card(PokerValue.king, PokerSuit.hearts)
        let card2 = Card(PokerValue.queen, PokerSuit.hearts)
        let card3 = Card(PokerValue.ace, PokerSuit.hearts)
        let card4 = Card(PokerValue.two, PokerSuit.hearts)
        let card5 = Card(PokerValue.five, PokerSuit.hearts)
        
        let pokerHand = PokerHand([card1, card2, card3, card4, card5])
        XCTAssertEqual(pokerHand.getHandCardValues(), [PokerValue.king, PokerValue.queen, PokerValue.ace, PokerValue.two, PokerValue.five])
    }
    
    func testGetCardSuits() {
        let card1 = Card(PokerValue.king, PokerSuit.hearts)
        let card2 = Card(PokerValue.queen, PokerSuit.spades)
        let card3 = Card(PokerValue.ace, PokerSuit.diamonds)
        let card4 = Card(PokerValue.two, PokerSuit.hearts)
        let card5 = Card(PokerValue.five, PokerSuit.spades)
        
        let pokerHand = PokerHand([card1, card2, card3, card4, card5])
        XCTAssertEqual(pokerHand.getHandCardSuits(), [PokerSuit.hearts, PokerSuit.spades, PokerSuit.diamonds, PokerSuit.hearts, PokerSuit.spades])
    }
    
    func testIsFlush() {
        let card1 = Card(PokerValue.king, PokerSuit.hearts)
        let card2 = Card(PokerValue.queen, PokerSuit.spades)
        let card3 = Card(PokerValue.ace, PokerSuit.diamonds)
        let card4 = Card(PokerValue.two, PokerSuit.hearts)
        let card5 = Card(PokerValue.five, PokerSuit.spades)
        let pokerHand = PokerHand([card1, card2, card3, card4, card5])
        XCTAssertEqual(pokerHandEvaluator., <#T##expression2: [T : U]##[T : U]#>)
    }
    

}

