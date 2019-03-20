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
        
        //makes app compatible with smaller screen iOS devices
        if self.view.frame.height < 600 {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }

    @IBAction func goButtonPressed(_ sender: Any) {
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 100
            }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func setupUI() {
        goButton.layer.cornerRadius = goButton.frame.width / 2
        goButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        goButton.layer.shadowOpacity = 0.75
        goButton.layer.masksToBounds = false
    }
    
}

