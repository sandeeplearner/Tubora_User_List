//
//  UserInfoViewControllerTests.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import XCTest
@testable import Tubora_UsersList
import SwiftyJSON

class UserInfoViewControllerTests: XCTestCase {
    var userInfoViewController : UserInfoTableViewController! = nil
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        userInfoViewController = storyboard.instantiateViewControllerWithIdentifier("userInfoViewController") as! UserInfoTableViewController

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewDidLoad() {
        //when
        let json = JSON(NSDictionary(dictionaryLiteral: ("first_name","TBUser989"),("last_name","Reddy"),("department","QA"),("job_title","Private Equity Associate"),("email_address","TBUser989.Reddy@xanadufinancials.com"),("employee_type","Internal"),("location","Washington DC")))
        userInfoViewController.currentlySelectedUser = Users(json: json)
        userInfoViewController.currentlyAppliedSearchFilter = SearchFilterEnum.department("QA")
        let _ = userInfoViewController.view
        
        //then
        XCTAssertNotNil(userInfoViewController.userInfoController,"Controller instance can not be null")
        var departmentKeyFound : Bool = false
        
        for (key,_) in userInfoViewController.processedUserInfo {
            if key == "Department" {
                departmentKeyFound = true
            }
        }
        XCTAssertFalse(departmentKeyFound,"Department key should not exist in processed user info")
    }
}
