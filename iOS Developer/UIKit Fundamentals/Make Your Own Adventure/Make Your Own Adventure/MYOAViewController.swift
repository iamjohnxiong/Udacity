//
//  MYOAViewController.swift
//  Make Your Own Adventure
//
//  Created by John Xiong on 1/17/18.
//  Copyright © 2018 John Xiong. All rights reserved.
//

import UIKit

class MYOAViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(MYOAViewController.startOver))
    }
    
    
    func startOver() {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    deinit {
        print("ViewController being denitted")
    }
}
