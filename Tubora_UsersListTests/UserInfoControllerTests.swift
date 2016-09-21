//
//  UserInfoControllerTests.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import XCTest
@testable import Tubora_UsersList
import SwiftyJSON

class UserInfoControllerTests: XCTestCase {
    var userInfoController : UserInfoController! = nil
    
    override func setUp() {
        super.setUp()
        userInfoController = UserInfoController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRemoveThePropertyForUser() {
        //given
        let json = JSON(NSDictionary(dictionaryLiteral: ("first_name","TBUser989"),("last_name","Reddy"),("department","QA"),("job_title","Private Equity Associate"),("email_address","TBUser989.Reddy@xanadufinancials.com"),("employee_type","Internal"),("location","Washington DC")))
        
        //when
        let processedInfo = userInfoController.removeTheProperty(fromUser: Users(json: json), forSelectedFilter: SearchFilterEnum.department(""))
        
        //then
        var departmentKeyFound : Bool = false
        for (key,_) in processedInfo {
            if key == "Department" {
                departmentKeyFound = true
            }
        }
        XCTAssertFalse(departmentKeyFound,"Department key should not exist in processed user info")
    }
    
    func testFindUserPropertyToIgnore() {
        //when
        let ignoredProperty = userInfoController.findUserPropertyToIgnore(forSelectedFilter: SearchFilterEnum.department(""))
        
        //then
        XCTAssertTrue(ignoredProperty == "department","Department property should be ignored")
    }
}
