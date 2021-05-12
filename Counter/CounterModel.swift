//
//  CounterModel.swift
//  Counter
//
//  Created by Игорь Яковлев on 12.05.21.
//

import Foundation

// MARK: - Model
struct Counter: Codable {
    var nameCounter: String = ""
    var valueCounter: Int32 = 0
    var description: String
}

// MARK: - Model Manager
class CounterManager: NSObject, Codable {
    
    //list of different counters
    public var listOfCounters = [Counter]()
    
    // lists in json
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    // MARK: - Initializators
    init?(json: Data) {
        if let newValue = try? JSONDecoder().decode(CounterManager.self, from: json) {
            self.listOfCounters = newValue.listOfCounters
        } else {
            return nil
        }
    }
    
    override init() {
        super.init()
        
        //fill model with date
        add(new: Counter(nameCounter: "Заправка бензином", valueCounter: 0, description: "Считаю количество заправок в месяц"))
        add(new: Counter(nameCounter: "Съеденные круасаны", valueCounter: 5, description: ""))
        add(new: Counter(nameCounter: "Не пью пиво дней", valueCounter: 0, description: "Считаю трезвые дни"))
        add(new: Counter(nameCounter: "Не курю дней", valueCounter: 0, description: "Считаю никотиновое воздержание"))
        
    }
    // MARK: - Notifications
    public func modelIsChanged() {
        print("model is changed")
    }
    
    
    // MARK: - Add new counter
    public func add(new counter: Counter) {
        listOfCounters.append(counter)
        modelIsChanged()
    }
    
    // MARK: - Delete counter
    public func removeCounter(by itemPos: Int) {
        listOfCounters.remove(at: itemPos)
        modelIsChanged()
    }
    
    //MARK: - Save model by JSON
    public func saveModel() {
        print("save model")
    }
}
