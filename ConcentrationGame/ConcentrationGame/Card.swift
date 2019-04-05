//
//  Card.swift
//  ConcentrationGame
//
//  Created by Maksim Bakharev on 05/04/2019.
//  Copyright © 2019 Maksim Bakharev. All rights reserved.
//

import Foundation
// MODEL

struct Card
{
	var isFaceUp = false
	var isMatched = false
	var identifier: Int
	
	static var identifierFactory = 0
	
	static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return identifierFactory
	}
	
	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
}
