//
//  UsersListViewController.swift
//  Tubora_UsersList
//
//  Created by Developer on 20/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var appliedFilterLabel: UILabel!
    
    lazy var usersListController : UsersListController = {
        let controller = UsersListController()
        return controller
    }()
    
    var filterredUsersArray : [Users]!
    var currentlyAppliedFilter : SearchFilterEnum!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersListController.initializeDatSource {
            self.currentlyAppliedFilter = SearchFilterEnum.department("Retail Brokerage")
            self.searchUsers()
        }
        
        self.tableView.registerNib(UINib(nibName: "usersCell", bundle: nil), forCellReuseIdentifier: "userCell")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 77
        self.tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchUsers() {
        self.filterredUsersArray = self.usersListController.searchWithSearchCriteria(self.currentlyAppliedFilter)
        self.appliedFilterLabel.text = self.currentlyAppliedFilter.searchFilterDescription()
        self.tableView.reloadData()
    }
    
    //MARK: Segue delegates
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "filterPopOver" {
            let filtersListVC = segue.destinationViewController as! FiltersListViewController
            filtersListVC.userSelectedFilter = self.currentlyAppliedFilter
            let popover: UIPopoverPresentationController = filtersListVC.popoverPresentationController!
            popover.delegate = self
        }
        else if segue.identifier == "userInfoSegue" {
            let userInfoVC = segue.destinationViewController as! UserInfoTableViewController
            userInfoVC.currentlySelectedUser = (sender as! UsersCell).passedUser
            userInfoVC.currentlyAppliedSearchFilter = self.currentlyAppliedFilter
        }
    }
    
    @IBAction func unwindToUserList(segue : UIStoryboardSegue) {
        //method for undwinding from filter screen to user list
        let filtersListVc = segue.sourceViewController as! FiltersListViewController
        self.currentlyAppliedFilter = filtersListVc.userSelectedFilter
        self.searchUsers()
    }
}

extension UsersListViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filterredUsersArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let userCell = self.tableView.dequeueReusableCellWithIdentifier("userCell") as! UsersCell
        let user = filterredUsersArray[indexPath.row]
        userCell.configureCell(withUser: user)
        return userCell
    }
}

extension UsersListViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("userInfoSegue", sender: self.tableView.cellForRowAtIndexPath(indexPath))
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

extension UsersListViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .FullScreen
    }
    
    func presentationController(controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
        let btnDone = UIBarButtonItem(title: NSLocalizedString("Done", comment: "Done"), style: .Done, target: self, action: #selector(doneButtonTapped))
        navigationController.topViewController!.navigationItem.rightBarButtonItem = btnDone
        return navigationController
    }
    
    func doneButtonTapped(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
