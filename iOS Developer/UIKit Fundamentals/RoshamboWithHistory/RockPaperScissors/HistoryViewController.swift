//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by John Xiong on 12/26/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    
    @IBAction func dismissHistoryVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var history = [RPSMatch]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ch = history[indexPath.row]
        let outcome: String
        if ch.p1 == ch.p2 {
            outcome = "Tie!"
        } else if ch.p1.defeats(ch.p2) {
            outcome = "Win!"
        } else {
            outcome = "Lose!"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        cell.textLabel?.text = outcome
        cell.detailTextLabel?.text = ch.p1.description + " vs " + ch.p2.description
        return cell
    }
    
}
