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
	@IBOutlet var flipCountLabel: UILabel!
	@IBOutlet var cardButtons: [UIButton]!
	
	
	// class model (green arrow)
	lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
	
	var flipCount = 0 {
		didSet {
			flipCountLabel.text = "Flips: \(flipCount)"
		}
	}
	
	
	@IBAction func startNewGame(_ sender: UIButton) {
		game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
		updateViewFromModel()
		emojiChoices = themes[Int(arc4random_uniform(UInt32(themes.count)))]
		flipCount = 0
	}
	
	@IBAction func touchCard(_ sender: UIButton)
	{
		flipCount += 1
		if let cardNumber = cardButtons.index(of: sender) {
			game.chooseCard(at: cardNumber)
			updateViewFromModel()
		} else {
			print ("chosen card was not in cardButtons")
		}
	}
	
	func updateViewFromModel()
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
	
	let themes = [
		["🎃", "👻", "😈", "👀", "😱", "💀", "🧟‍♀️", "🧛‍♂️"],
		["🥶", "❄️", "🌨", "☃️", "🥂", "🎄", "🌟", "🎅"],
		["❤️", "🎀", "👄", "😻", "😘", "🥰", "💑", "💐"],
		["🐶", "🦁", "🐙", "🐰", "🐷", "🐸", "🐒", "🐬"],
		["🍔", "🍏", "🍌", "🥐", "🥓", "🍝", "🎂", "🍫"],
		["🚗", "🚌", "🏎", "🚜", "🚃", "✈️", "🚁", "🛸"]
	]
	
	lazy var emojiChoices = themes[Int(arc4random_uniform(UInt32(themes.count)))]
	
	var emoji = [Int:String]()
	
	func emoji(for card: Card) -> String {
		if emoji[card.identifier] == nil, emojiChoices.count > 0 {
			let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
			emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
		}
		return emoji[card.identifier] ?? "?"
	}
}

