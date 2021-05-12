//
//  CounterTableViewCell.swift
//  Counter
//
//  Created by Игорь Яковлев on 12.05.21.
//

import UIKit

class CounterTableViewCell: UITableViewCell {

    @IBOutlet weak var nameCounter: UILabel!
    
    @IBOutlet weak var valueCounter: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
