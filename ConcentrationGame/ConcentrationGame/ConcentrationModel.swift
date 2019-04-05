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
	var cards = [Card]()
	
	var indexOfOneAnyOnlyFaceUpCard: Int?
	
	// MAIN GAME LOGIC
	func chooseCard(at index: Int) {
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneAnyOnlyFaceUpCard, matchIndex != index {
				// check if cards match
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				indexOfOneAnyOnlyFaceUpCard = nil
				
			} else {
				// either no cards or 2 cards are face up
				for flipDownIndex in cards.indices {
					cards[flipDownIndex].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneAnyOnlyFaceUpCard = index
			}
		}
	}
	
	
	
	init(numberOfPairsOfCards: Int) {
		for _ in 1...numberOfPairsOfCards {
			let card = Card()
			cards += [card,card]
		}
		//TODO: Shuffle the Cards
	}
}
