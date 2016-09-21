//
//  UsersListViewControllerTest.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import XCTest
@testable import Tubora_UsersList

class UsersListViewControllerTest: XCTestCase {
    var usersListViewController : UsersListViewController! = nil
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        usersListViewController = storyboard.instantiateViewControllerWithIdentifier("usersListViewController") as! UsersListViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testViewDidLoad() {
        //when
        let _ = usersListViewController.view

        //then
        XCTAssertNotNil(usersListViewController.usersListController,"Controller instance can not be nil")
        XCTAssertTrue(usersListViewController.tableView.delegate === usersListViewController,"tableview delegate should be view controller")
        XCTAssertTrue(usersListViewController.tableView.dataSource === usersListViewController,"tableview data source should be view controller")
    }
    
    func testDataIntilizationWhenValidJSONFilePresentInProject() {
        //given
        let _ = usersListViewController.view
        
        //when
        usersListViewController.usersListController.initializeDatSource { 
            //then
            XCTAssertTrue(UsersList.sharedUsersList.usersArray.count > 1, "User array should be greater than zero")
            XCTAssertNotNil(self.usersListViewController.currentlyAppliedFilter,"Currently applied filter should not be nil")
        }
    }
}
