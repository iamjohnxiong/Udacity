//
//  ViewController.swift
//  Lesson2_Experiment
//
//  Created by John Xiong on 11/27/17.
//  Copyright © 2017 John Xiong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func experiment() {
        let controller = UIAlertController(title: "Hello World", message: "Message", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cool Dude", style: .default, handler: nil)
        controller.addAction(alertAction)
        
        self.present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

