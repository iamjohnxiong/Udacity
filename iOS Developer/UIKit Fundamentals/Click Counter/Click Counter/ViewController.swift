//
//  ViewController.swift
//  Click Counter
//
//  Created by John Xiong on 11/7/17.
//  Copyright © 2017 John Xiong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var count = 0
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func incrementCount() {
        self.count += 1
        configureUI()
    }
    
    
    func configureUI() {
        self.label.text = "\(self.count)"
    }
}

