//
//  ResultViewController.swift
//  Roshamboo
//
//  Created by Srikar Thottempudi on 2/17/19.
//  Copyright © 2019 Srikar Thottempudi. All rights reserved.
//

import UIKit

enum GenerateChoice: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func generateOpponentsPlay() -> GenerateChoice {
        let choices = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return GenerateChoice(rawValue: choices[randomChoice])!
    }
}

class ResultViewController: UIViewController {
    var userChoice: GenerateChoice!
    var opponentChoice = GenerateChoice.generateOpponentsPlay()
    
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayResult()
    }
    
    private func displayResult() {
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs \(opponentChoice.rawValue)"
        switch (userChoice!, opponentChoice) {
        case let(user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper) :
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup)"
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        resultText.text = text
        resultImage.image = UIImage(named: imageName)
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
