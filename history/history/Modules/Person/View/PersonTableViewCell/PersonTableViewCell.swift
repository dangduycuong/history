//
//  PersonTableViewCell.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(title: String?) {
        avatarImageView.image = R.image.king()
        nameLabel.text = title
        nameLabel.font = UIFont.systemFont(ofSize: 21)
    }
    
}
