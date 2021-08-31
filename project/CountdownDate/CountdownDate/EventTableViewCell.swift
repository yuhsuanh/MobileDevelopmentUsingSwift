//
//  EventTableViewCell.swift
//  CountdownDate
//
//  Created by Yu-Hsuan Huang on 2021/7/31.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    //UI Objects
    @IBOutlet weak var labelEventname: UILabel!
    
    @IBOutlet weak var labelDesc: UILabel!
    
    @IBOutlet weak var labelDays: UILabel!
    
    @IBOutlet weak var labelStartDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //Change table cell on selected background color
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.5)
        selectedBackgroundView = backgroundView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
