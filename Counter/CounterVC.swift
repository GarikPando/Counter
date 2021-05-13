//
//  CounterVC.swift
//  Counter
//
//  Created by Игорь Яковлев on 13.05.21.
//

import UIKit

class CounterVC: UIViewController {

    @IBOutlet weak var counterDescription: UILabel!
    
    @IBOutlet weak var valueCounter: UIButton!
    
    @IBAction func incrementValue(_ sender: UIButton) {
        if let _ = currentCounter {
            currentCounter!.valueCounter += 1
            valueCounter.setTitle(String(currentCounter!.valueCounter), for: .normal)
        }
    }
    
    var currentCounter: Counter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let counter = currentCounter else {
            return
        }
        counterDescription.text = counter.nameCounter
        valueCounter.setTitle(String(counter.valueCounter), for: .normal)
        
    }
    

    

}
