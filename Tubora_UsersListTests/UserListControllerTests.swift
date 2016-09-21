//
//  UserListControllerTests.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import XCTest
@testable import Tubora_UsersList
import SwiftyJSON

class UserListControllerTests: XCTestCase {
    var userListController : UsersListController! = nil
    
    override func setUp() {
        super.setUp()
        self.userListController = UsersListController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchWithSearchCriteriaWithCorrectSearchCrieteria() {
        //given
        let json = JSON(NSDictionary(dictionaryLiteral: ("first_name","TBUser989"),("last_name","Reddy"),("department","QA"),("job_title","Private Equity Associate"),("email_address","TBUser989.Reddy@xanadufinancials.com"),("employee_type","Internal"),("location","Washington DC")))
        
        UsersList.sharedUsersList.usersArray = [Users(json:json)]
        
        //then
        let foundUser = userListController.searchWithSearchCriteria(SearchFilterEnum.department("QA"))
        XCTAssertTrue(foundUser.count == 1, "There should be one user belonging to department QA")
    }
    
    func testSearchWithSearchCriteriaWithInvalidSearchCrieteria() {
        //given
        let json = JSON(NSDictionary(dictionaryLiteral: ("first_name","TBUser989"),("last_name","Reddy"),("department","QA"),("job_title","Private Equity Associate"),("email_address","TBUser989.Reddy@xanadufinancials.com"),("employee_type","Internal"),("location","Washington DC")))
        
        UsersList.sharedUsersList.usersArray = [Users(json:json)]
        
        //then
        let foundUser = userListController.searchWithSearchCriteria(SearchFilterEnum.department("ABCD"))
        XCTAssertTrue(foundUser.count == 0, "There should be zero user belonging to department ABCD")
    }
}
