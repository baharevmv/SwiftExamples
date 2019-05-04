//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Maksim Bakharev on 03/04/2019.
//  Copyright © 2019 Maksim Bakharev. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
	@IBOutlet private var flipCountLabel: UILabel!
	@IBOutlet private var cardButtons: [UIButton]!
	
	
	// class model (green arrow)
	private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
	
	var numberOfPairsOfCards: Int {
		return (cardButtons.count+1)/2 	// just getter - no need to write get/set
	}
	
	private(set) var flipCount = 0 {
		didSet {
			flipCountLabel.text = "Flips: \(flipCount)"
		}
	}
	
	
	@IBAction private func startNewGame(_ sender: UIButton) {
		game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
		updateViewFromModel()
		emojiChoices = themes[Int(arc4random_uniform(UInt32(themes.count)))]
		flipCount = 0
	}
	
	@IBAction private func touchCard(_ sender: UIButton)
	{
		flipCount += 1
		if let cardNumber = cardButtons.firstIndex(of: sender) {
			game.chooseCard(at: cardNumber)
			updateViewFromModel()
		} else {
			print ("chosen card was not in cardButtons")
		}
	}
	
	private func updateViewFromModel()
	{
		for index in cardButtons.indices
		{
			let button = cardButtons[index]
			let card = game.cards[index]
			if card.isFaceUp
			{
				button.setTitle(emoji(for: card), for: UIControl.State.normal)
				button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
			} else {
				button.setTitle("", for: UIControl.State.normal)
				button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
			}
			// TODO: Make game ends when all cards are FacedUp
		}
	}
	
	private let themes = [
		["🎃", "👻", "😈", "👀", "😱", "💀", "🧟‍♀️", "🧛‍♂️"],
		["🥶", "❄️", "🌨", "☃️", "🥂", "🎄", "🌟", "🎅"],
		["❤️", "🎀", "👄", "😻", "😘", "🥰", "💑", "💐"],
		["🐶", "🦁", "🐙", "🐰", "🐷", "🐸", "🐒", "🐬"],
		["🍔", "🍏", "🍌", "🥐", "🥓", "🍝", "🎂", "🍫"],
		["🚗", "🚌", "🏎", "🚜", "🚃", "✈️", "🚁", "🛸"]
	]
	
	private lazy var emojiChoices = themes[Int(arc4random_uniform(UInt32(themes.count)))]
	
	private var emoji = [Int:String]()
	
	private func emoji(for card: Card) -> String {
		if emoji[card.identifier] == nil, emojiChoices.count > 0 {
			emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
		}
		return emoji[card.identifier] ?? "?"
	}
}

extension Int {
	var arc4random: Int {
		if self > 0 {
			return Int(arc4random_uniform(UInt32(self)))
		}
		else if self < 0 {
			return -Int(arc4random_uniform(UInt32(abs(self))))
		}
		else {
			return 0    
		}
	}
}
