//
//  CounterVC.swift
//  Counter
//
//  Created by Игорь Яковлев on 13.05.21.
//

import UIKit

class CounterVC: UIViewController {

    //MARK: - Outlets and Actions
    @IBOutlet weak var counterDescription: UILabel!
    
    @IBOutlet weak var valueCounter: UIButton!
    
    @IBAction func incrementValue(_ sender: UIButton) {
        if let _ = currentCounter {
            currentCounter!.valueCounter += 1
            valueCounter.setTitle(String(currentCounter!.valueCounter), for: .normal)
            if let item = counterItem {
                delegate?.onIncrement(counter: item)
            }
            
        }
    }
    
    //MARK: - Vars
    var currentCounter: Counter?
    var delegate: CounterProtocol?
    var counterItem: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let counter = currentCounter else {
            return
        }
        counterDescription.text = counter.nameCounter
        valueCounter.setTitle(String(counter.valueCounter), for: .normal)
        
    }
}

extension CounterVC: CounterProtocol {
    func onIncrement(counter item: Int) {
    }
}
