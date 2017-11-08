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
    var label: UILabel!
    var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        self.view.addSubview(label)
        self.label = label
        self.label2 = label
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 250, y: 150, width: 60, height: 60)
        label2.text = "0"
        self.view.addSubview(label2)
        self.label2 = label2
        
        // Button
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 250, width: 60, height: 60)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(incrementCount), for: .touchUpInside)
        
        let decreaseButton = UIButton()
        decreaseButton.frame = CGRect(x: 250, y: 250, width: 60, height: 60)
        decreaseButton.setTitle("Minus", for: .normal)
        decreaseButton.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(decreaseButton)
        decreaseButton.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
    }
    
    func incrementCount() {
        self.count += 1
        configureUI()
    }
    
    func decreaseCount() {
        self.count -= 1
        configureUI()
    }
    
    func configureUI() {
        self.label.text = "\(self.count)"
        self.label2.text = "\(self.count)"
        self.view.backgroundColor = getRandomColor()
    }

    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
}

