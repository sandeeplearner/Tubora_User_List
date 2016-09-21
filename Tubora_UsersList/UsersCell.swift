//
//  UsersCell.swift
//  Tubora_UsersList
//
//  Created by Developer on 20/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import UIKit

class UsersCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userDepartmentLabel: UILabel!
    var passedUser : Users!
    
    func configureCell(withUser user : Users) {
        self.passedUser = user
        self.userNameLabel.text = "\(user.firstName) \(user.lastName)"
        self.userDepartmentLabel.text = "\(user.department)"
    }
}
