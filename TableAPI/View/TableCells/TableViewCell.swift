//
//  TableViewCell.swift
//  TableAPI
//
//  Created by Field Employee on 10/29/20.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }    
}
