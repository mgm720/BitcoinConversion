//
//  ResultViewController.swift
//  BitcoinConversion
//
//  Created by Michael Miles on 3/19/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ResultViewController: UIViewController {
    
    var currencyResult = ""
    var symbolResult = ""
    var searchURL = ""

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getBitcoinData(url: searchURL)
    }
    
    //
    //    //MARK: - Networking
    //    /***************************************************************/
    //
    func getBitcoinData(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess! Got the Bitcoin data")
                    let bitcoinJSON : JSON = JSON(response.result.value!)
                    
                    self.updateBitcoinData(json: bitcoinJSON)
                    
                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.resultLabel.text = "Connection Issues"
                }
        }
        
    }
    //
    //
    //
    //
    //
    //    //MARK: - JSON Parsing
    //    /***************************************************************/
    //
    func updateBitcoinData(json : JSON) {
        
        if let priceResult = json["ask"].double {
            resultLabel.text = "\(symbolResult)\(priceResult) \(currencyResult)"
        }
        else {
            resultLabel.text = "Price Unavailable"
        }
    }

}
