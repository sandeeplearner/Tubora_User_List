//
//  FiltersListViewController.swift
//  Tubora_UsersList
//
//  Created by Developer on 20/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import UIKit

class FiltersListViewController: UITableViewController {
    
    lazy var filterListController : FiltersListController = {
        let controller = FiltersListController()
        return controller
    }()
    
    private var filterInfo : [SearchFilterEnum : [String]]!
    var userSelectedFilter : SearchFilterEnum!
    private var currentlyExpandedSection : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterInfo = self.filterListController.initializeFilterDataSource()
        if userSelectedFilter != nil {
            findAndExpandSectionForUserSelectedFilter()
        }
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return filterInfo.keys.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.currentlyExpandedSection != nil && section == self.currentlyExpandedSection {
            return (filterInfo[Array(filterInfo.keys)[section]]?.count)!
        }
        else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("filterCell")
        let filterName = filterInfo[Array(filterInfo.keys)[indexPath.section]]![indexPath.row]
        cell?.textLabel?.text = filterName.characters.count == 0 ? "None" : filterName
        
        if self.userSelectedFilter != nil && self.userSelectedFilter == Array(filterInfo.keys)[indexPath.section] && self.userSelectedFilter.getAscociatedValue() == filterName {
            cell?.accessoryType = .Checkmark
        }
        else {
            cell?.accessoryType = .None
        }
        return cell!
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UINib(nibName: "SearchSectionHeaderView", bundle: nil).instantiateWithOwner(nil, options: [:])[0] as! SearchSectionHeaderView
        headerView.configureView(forSection: section, withCategory: Array(filterInfo.keys)[section])
        headerView.delegate = self
        return headerView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch Array(filterInfo.keys)[indexPath.section] {
        case .department(""):
            self.userSelectedFilter = SearchFilterEnum.department(filterInfo[Array(filterInfo.keys)[indexPath.section]]![indexPath.row])
        case .jobtitle(""):
            self.userSelectedFilter = SearchFilterEnum.jobtitle(filterInfo[Array(filterInfo.keys)[indexPath.section]]![indexPath.row])
        case .location(""):
            self.userSelectedFilter = SearchFilterEnum.location(filterInfo[Array(filterInfo.keys)[indexPath.section]]![indexPath.row])
        default:
            self.userSelectedFilter = SearchFilterEnum.type(filterInfo[Array(filterInfo.keys)[indexPath.section]]![indexPath.row])
        }
        self.performSegueWithIdentifier("unwindToUserListSegue", sender: nil)
    }
    
    func findAndExpandSectionForUserSelectedFilter() {
        var sectionCount = 0;
        for searchFilterEnum in self.filterInfo.keys {
            if userSelectedFilter == searchFilterEnum {
                self.seactionHeaderDidTap(atSection: sectionCount)
            }
            sectionCount += 1
        }
    }
}

extension FiltersListViewController : SearchSectionHeaderViewProtocol {
    func seactionHeaderDidTap(atSection section: Int) {
        let previouslyExpandedSection = self.currentlyExpandedSection
        self.currentlyExpandedSection = section
        
        let indexSet = NSMutableIndexSet(index: section)
        if let _ = previouslyExpandedSection {
            indexSet.addIndex(previouslyExpandedSection!)
        }
        self.tableView.reloadSections(indexSet, withRowAnimation: .Automatic)
    }
}
