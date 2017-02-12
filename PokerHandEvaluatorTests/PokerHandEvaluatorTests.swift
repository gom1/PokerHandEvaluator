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
        let card1 = Card(PokerValue.king, PokerSuit.hearts)
        let card2 = Card(PokerValue.jack, PokerSuit.hearts)
        let card3 = Card(PokerValue.ten, PokerSuit.diamonds)
        let card4 = Card(PokerValue.three, PokerSuit.spades)
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

}

