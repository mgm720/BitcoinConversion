//
//  SelectorViewController.swift
//  BitcoinConversion
//
//  Created by Michael Miles on 3/19/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class SelectorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let symbolArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCAUD"
    var currencySelected = "AUD"
    var symbolSelected = "$"
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var convertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        setupUI()
    }
    
    func setupUI() {
        if let name = defaults.string(forKey: "Name") {
        helloLabel.text = "Hello, \(name)!"
        }
        
        convertButton.layer.cornerRadius = 20
        convertButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        convertButton.layer.shadowOpacity = 0.75
        convertButton.layer.masksToBounds = false
    }
    
    //Mark: Picker Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencySelected = currencyArray[row]
        
        finalURL = baseURL + currencySelected
        symbolSelected = symbolArray[row]
    }

    // MARK: - Navigation
    @IBAction func convertButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        
        destinationVC.currencyResult = currencySelected
        destinationVC.searchURL = finalURL
        destinationVC.symbolResult = symbolSelected
    }

}
