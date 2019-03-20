//
//  ViewController.swift
//  BitcoinConversion
//
//  Created by Michael Miles on 3/19/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    @IBAction func goButtonPressed(_ sender: Any) {
        
    }
    
    func setupUI() {
        goButton.layer.cornerRadius = goButton.frame.width / 2
        goButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        goButton.layer.shadowOpacity = 0.75
        goButton.layer.masksToBounds = false
    }
    
}

