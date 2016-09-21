//
//  UserInfoTableViewController.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import UIKit

class UserInfoTableViewController: UITableViewController {

    var currentlySelectedUser : Users!
    var currentlyAppliedSearchFilter : SearchFilterEnum!
    var processedUserInfo : [(String,String)]!
    
    lazy var userInfoController : UserInfoController = {
        let controller = UserInfoController()
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        processedUserInfo = self.userInfoController.removeTheProperty(fromUser: currentlySelectedUser, forSelectedFilter: currentlyAppliedSearchFilter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return processedUserInfo.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("userInfoCell") as! UserInfoCell
        cell.propertyLabel.text = processedUserInfo[indexPath.row].0
        cell.valueLabel.text = processedUserInfo[indexPath.row].1
        return cell
    }
}
