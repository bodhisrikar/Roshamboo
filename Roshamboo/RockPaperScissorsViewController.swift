//
//  RockPaperScissorsViewController.swift
//  Roshamboo
//
//  Created by Srikar Thottempudi on 2/17/19.
//  Copyright © 2019 Srikar Thottempudi. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {
    
    @IBAction func choiceRock(_ sender: UIButton) {
        let resultController = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultController.userChoice = getUserChoice(sender)
        navigationController?.pushViewController(resultController, animated: true)
        //present(resultController, animated: true, completion: nil)
    }
    
    @IBAction func choicePaper(_ sender: UIButton) {
        performSegue(withIdentifier: "chosePaper", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultController = segue.destination as! ResultViewController
        resultController.userChoice = getUserChoice(sender as! UIButton)
    }
    
    private func getUserChoice(_ sender: UIButton) -> GenerateChoice {
        let choice = sender.title(for: UIControl.State())!
        return GenerateChoice(rawValue: choice)!
    }
}

