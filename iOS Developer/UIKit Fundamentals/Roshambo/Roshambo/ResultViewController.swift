//
//  ResultViewController.swift
//  Roshambo
//
//  Created by John Xiong on 11/28/17.
//  Copyright © 2017 John Xiong. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultImage: UIImage?
    var result: String?
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.resultImageView.image = resultImage
        self.resultLabel.text = result
    }
}
