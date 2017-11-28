//
//  ViewController.swift
//  Roshambo
//
//  Created by John Xiong on 11/28/17.
//  Copyright © 2017 John Xiong. All rights reserved.
//

import UIKit

enum PlayerType {
    case User
    case Opponent
    case Tie
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pressedRock() {
        let resultViewController: ResultViewController
        resultViewController = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        let winner = comparePlays(userPlay: "rock", opponentPlay: getOpponentsPlay())
        
        if winner == .User {
            resultViewController.result = "Rock Crushes Scissors!"
            resultViewController.resultImage = UIImage(named: "RockCrushesScissors")
        } else if winner == .Opponent {
            resultViewController.resultImage = UIImage(named: "PaperCoversRock")
            resultViewController.result = "Paper Covers Rock!"
        } else {
            resultViewController.resultImage = UIImage(named: "itsATie")
            resultViewController.result = "It's A Tie!"
        }
        
        present(resultViewController, animated: true, completion: nil)
    }
    
    func comparePlays(userPlay: String, opponentPlay: String) -> PlayerType {
        var playerType: PlayerType
        
        if userPlay == opponentPlay {
            playerType = .Tie
        } else {
            if userPlay == "rock" {
                playerType = (opponentPlay == "paper") ? PlayerType.Opponent : PlayerType.User
            } else if userPlay == "paper" {
                playerType = (opponentPlay == "scissors") ? PlayerType.Opponent : PlayerType.User
            } else {
                playerType = (opponentPlay == "rock") ? PlayerType.Opponent : PlayerType.User
            }
        }
        
        return playerType
    }
    
    func getOpponentsPlay() -> String {
        var play: String
        
        let i = arc4random_uniform(3) + 1
        
        switch i {
        case 1:
            play = "rock"
            break
        case 2:
            play = "paper"
            break
        default:
            play = "scissors"
        }
        
        return play
    }
    
    /*
     Rock: Code
     Paper: Code & Segue
     Scissor: Segue
     */
    
}

