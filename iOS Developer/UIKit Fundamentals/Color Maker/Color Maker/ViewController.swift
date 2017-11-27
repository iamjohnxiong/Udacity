//
//  ViewController.swift
//  Color Maker
//
//  Created by John Xiong on 11/27/17.
//  Copyright © 2017 John Xiong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var colorView: UIView!
    
    
    @IBAction func sliderValueChanged(_ sender: AnyObject) {
        
        setColor();
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setColor();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setColor() {
        let r: CGFloat = CGFloat(self.redSlider.value)
        let b: CGFloat = CGFloat(self.blueSlider.value)
        let g: CGFloat = CGFloat(self.greenSlider.value)
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }

}

