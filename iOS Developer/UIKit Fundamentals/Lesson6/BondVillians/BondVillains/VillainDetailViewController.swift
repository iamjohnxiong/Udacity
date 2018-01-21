//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by John Xiong on 1/21/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

class VillainDetailViewController: UIViewController {
    
    var villain: Villain!
    
    @IBOutlet weak var villainImage: UIImageView!
    
    @IBOutlet weak var villainLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.villainLabel.text = self.villain.name
        self.villainImage!.image = UIImage(named: villain.imageName)
    }
}
