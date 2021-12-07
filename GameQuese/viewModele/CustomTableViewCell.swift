//
//  CustomTableViewCell.swift
//  GameQuese
//
//  Created by Temur on 06/12/2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var nickLable: UILabel!
    @IBOutlet weak var avatarView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
