//
//  ViewController.swift
//  PatienceToMoney
//
//  Created by 松山響也 on 2020/06/09.
//  Copyright © 2020 Kyoya Matsuyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let picture = UIImage(named: "money")
        button.setImage(picture, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 40.0
    }
    
    @IBAction func next(_ sender: Any) {
    }
    


}

