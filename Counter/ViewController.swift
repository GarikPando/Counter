//
//  ViewController.swift
//  Counter
//
//  Created by Игорь Яковлев on 12.05.21.
//

import UIKit

protocol CounterProtocol {
    func onIncrement(counter item: Int)
    func onDecrement(counter item: Int)
    func onReset(counter item: Int)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CounterProtocol {
    
    
    //MARK: - Model
    var list = CounterManager()
    
    @IBOutlet weak var counterTableView: UITableView!
    
    
    @IBAction func addNewCounter(_ sender: UIBarButtonItem) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
        counterTableView.delegate = self
        counterTableView.dataSource = self
        
    }

    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.listOfCounters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CounterCell", for: indexPath)
        if let counterCell = cell as? CounterTableViewCell {
            counterCell.nameCounter.text = list.listOfCounters[indexPath.row].nameCounter
            counterCell.valueCounter.text = String(list.listOfCounters[indexPath.row].valueCounter)
        }
        return cell
    }
    	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowCounter", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.listOfCounters.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    	
    
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CounterVC {
            destination.delegate = self
            if let itemIndex = counterTableView.indexPathForSelectedRow?.row {
                destination.counterItem = itemIndex
                destination.currentCounter = list.listOfCounters[itemIndex]
                counterTableView.deselectRow(at: counterTableView.indexPathForSelectedRow!, animated: true)
            }
        }
    }
    
    //MARK: - Update counters in tableview
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        counterTableView.beginUpdates()
        counterTableView.reloadData()
        counterTableView.endUpdates()
        list.saveModel()
    }
    
    //MARK: - Change model by protocol
    func onIncrement(counter item: Int) {
        list.listOfCounters[item].valueCounter += 1
    }
    func onDecrement(counter item: Int) {
        if list.listOfCounters[item].valueCounter > 0 {
            list.listOfCounters[item].valueCounter -= 1
        }
    }
    
    func onReset(counter item: Int) {
        list.listOfCounters[item].valueCounter = 0
    }
    
    //MARK: - Load model from JSON
    func loadModel() {
        if let documentURL = try? FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("counter.json") {
            if let jsonData = try? Data(contentsOf: documentURL) {
                list = CounterManager(json: jsonData) ?? CounterManager()
            }
        }
    }
    

}

