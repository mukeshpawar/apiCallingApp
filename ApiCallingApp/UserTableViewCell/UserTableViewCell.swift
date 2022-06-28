//
//  UserTableViewCell.swift
//  ApiCallingApp
//
//  Created by Mukesh Pawar on 24/06/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    
    var employee : UserData? {
        didSet {
//            let empId = String(format: "%d", employee?.id);
            employeeIdLabel.text =  "empId"
            employeeNameLabel.text = employee?.employeeName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
