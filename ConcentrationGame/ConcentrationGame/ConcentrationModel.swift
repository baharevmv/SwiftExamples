//
//  ConcentrationModel.swift
//  ConcentrationGame
//
//  Created by Maksim Bakharev on 05/04/2019.
//  Copyright © 2019 Maksim Bakharev. All rights reserved.
//

import Foundation

class Concentration
{
	private(set) var cards = [Card]()
	
	private var indexOfOneAnyOnlyFaceUpCard: Int?
	{
		get {
			var foundIndex: Int?
			for index in cards.indices {
				if cards[index].isFaceUp {
					if foundIndex == nil {
						foundIndex = index
					} else {
						return nil;
					}
				}
			}
			return foundIndex
		}
		set {
			for index in cards.indices {
				cards[index].isFaceUp = (index == newValue)
			}
			
		}
	}
	
	// MAIN GAME LOGIC
	func chooseCard(at index: Int) {
		assert(cards.indices.contains(index), "Concentration.choosecard(at: \(index)): Chosen index not in the cards")
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneAnyOnlyFaceUpCard, matchIndex != index {
				// check if cards match
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				
			} else {
				// either no cards or 2 cards are face
				indexOfOneAnyOnlyFaceUpCard = index
			}
		}
	}
	
	init(numberOfPairsOfCards: Int) {
		assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): you must have at least one pair of cards")
		for _ in 1...numberOfPairsOfCards {
			let card = Card()
			cards += [card,card]
		}
		cards.shuffle()
	}
}
