//
//  TableViewCell.swift
//  Sozluk App Tasarim
//
//  Created by Furkan on 8.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblEnglish: UILabel!
    @IBOutlet weak var lblTurkish: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
