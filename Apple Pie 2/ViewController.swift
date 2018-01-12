//
//  ViewController.swift
//  Apple Pie 2
//
//  Created by Student on 1/4/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

var listOfWords = ["Hambugers" , "Sports" , "french fries" , "glove" , "second base"]

let incorrectMovesAllowed = 6

var totalWins = 0
var totalLosses = 0

class ViewController: UIViewController {
    
    

  
   
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var treeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var currentGame: Game!
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord , incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Wins\(totalWins), Losses\(totalLosses)"
        treeImageView.image = UIImage (named: "Tree\(currentGame.incorrectMovesRemaining)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

