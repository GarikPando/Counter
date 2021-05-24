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
    
    @IBOutlet weak var lastModifyDateLabel: UILabel!
    
    @IBOutlet weak var valueCounter: UIButton!
    
    @IBAction func resetCounter(_ sender: UIButton) {
        if var curCounter = currentCounter {
            curCounter.valueCounter = 0
            valueCounter.setTitle("0", for: .normal)
            if let item = counterItem {
                delegate?.onReset(counter: item)
            }
            currentCounter = curCounter
        }
    }
    
    @IBAction func decrementCounter(_ sender: UIButton) {
        if var curCounter = currentCounter {
            if curCounter.valueCounter > 0 {
                curCounter.valueCounter -= 1
                valueCounter.setTitle(String(curCounter.valueCounter), for: .normal)
                if let item = counterItem {
                    delegate?.onDecrement(counter: item)
                }
                currentCounter = curCounter
            }
        }
    }
    
    @IBAction func incrementValue(_ sender: UIButton) {
        if var curCounter = currentCounter {
            
            curCounter.valueCounter += 1
 
            UIView.animate(withDuration: 0.5) {
                self.valueCounter.transform = CGAffineTransform.identity.scaledBy(x: 3, y: 3)
            } completion: { finish in
                self.valueCounter.transform = CGAffineTransform.identity
            }
            
            valueCounter.setTitle(String(curCounter.valueCounter), for: .normal)
            
            if let item = counterItem {
                delegate?.onIncrement(counter: item)
            }
            currentCounter = curCounter
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
        
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
      
        if let lastDate = counter.lastModification {
            lastModifyDateLabel.text = "Дата модификации: " + formatter.string(from: lastDate)
        }
    }
}

extension CounterVC: CounterProtocol {
    func onDecrement(counter item: Int) {
    }
    
    func onReset(counter item: Int) {
    }
    
    func onIncrement(counter item: Int) {
    }
}
