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

enum PlayType {
    case Rock
    case Paper
    case Scissor
}

class ViewController: UIViewController {
    
    @IBAction func pressedPaper() {
        self.performSegue(withIdentifier: "PaperSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        
        if segue.identifier == "PaperSegue" {
            let winner = comparePlays(userPlay: .Paper, opponentPlay: getOpponentsPlay())
            
            if winner == .User {
                resultViewController.result = "Paper Covers Rock!!"
                resultViewController.resultImage = UIImage(named: "PaperCoversRock")
            } else if winner == .Opponent {
                resultViewController.resultImage = UIImage(named: "ScissorsCutPaper")
                resultViewController.result = "Scissors Cut Paper!"
            } else {
                resultViewController.resultImage = UIImage(named: "itsATie")
                resultViewController.result = "It's A Tie!"
            }
        } else {
            let winner = comparePlays(userPlay: .Scissor, opponentPlay: getOpponentsPlay())
            
            if winner == .User {
                resultViewController.result = "Scissors Cut Paper"
                resultViewController.resultImage = UIImage(named: "ScissorsCutPaper")
            } else if winner == .Opponent {
                resultViewController.resultImage = UIImage(named: "RockCrushesScissors")
                resultViewController.result = "Rock Crushes Scissors!"
            } else {
                resultViewController.resultImage = UIImage(named: "itsATie")
                resultViewController.result = "It's A Tie!"
            }
        }

    }


    @IBAction func pressedRock() {
        let resultViewController: ResultViewController
        resultViewController = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        let winner = comparePlays(userPlay: .Rock, opponentPlay: getOpponentsPlay())
        
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
    
    func comparePlays(userPlay: PlayType, opponentPlay: PlayType) -> PlayerType {
        var playerType: PlayerType
        
        if userPlay == opponentPlay {
            playerType = .Tie
        } else {
            if userPlay == .Rock {
                playerType = (opponentPlay == .Paper) ? PlayerType.Opponent : PlayerType.User
            } else if userPlay == .Paper {
                playerType = (opponentPlay == .Scissor) ? PlayerType.Opponent : PlayerType.User
            } else {
                playerType = (opponentPlay == .Rock) ? PlayerType.Opponent : PlayerType.User
            }
        }
        
        return playerType
    }
    
    func getOpponentsPlay() -> PlayType {
        var play: PlayType
        
        let i = arc4random_uniform(3) + 1
        
        switch i {
        case 1:
            play = .Rock
            break
        case 2:
            play = .Paper
            break
        default:
            play = .Scissor
        }
        
        return play
    }
    
    /*
     Rock: Code
     Paper: Code & Segue
     Scissor: Segue
     */
    
}

