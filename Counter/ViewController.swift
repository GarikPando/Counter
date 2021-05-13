//
//  ViewController.swift
//  Counter
//
//  Created by Игорь Яковлев on 12.05.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Model
    var list = CounterManager()
    
    @IBOutlet weak var counterTableView: UITableView!
    
    
    @IBAction func addNewCounter(_ sender: UIBarButtonItem) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterTableView.delegate = self
        counterTableView.dataSource = self
        
    }

    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.listOfCounters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CounterCell", for: indexPath) as! CounterTableViewCell
        
        cell.nameCounter.text = list.listOfCounters[indexPath.row].nameCounter
        cell.valueCounter.text = String(list.listOfCounters[indexPath.row].valueCounter)
        
        return cell
    }
    	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowCounter", sender: self)
        
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CounterVC {
            destination.currentCounter = list.listOfCounters[(counterTableView.indexPathForSelectedRow?.row)!]
            counterTableView.deselectRow(at: counterTableView.indexPathForSelectedRow!, animated: true)
        }
    }
    

}

