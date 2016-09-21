//
//  FilterListControllerTests.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import XCTest
@testable import Tubora_UsersList
import SwiftyJSON

class FilterListControllerTests: XCTestCase {
    var filterListController : FiltersListController! = nil
    
    override func setUp() {
        super.setUp()
        filterListController = FiltersListController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitializeFilterDataSource() {
        //given
        let json1 = JSON(NSDictionary(dictionaryLiteral: ("first_name","TBUser989"),("last_name","Reddy"),("department","QA"),("job_title","Private Equity Associate"),("email_address","TBUser989.Reddy@xanadufinancials.com"),("employee_type","Internal"),("location","Washington DC")))
        
        let json2 = JSON(NSDictionary(dictionaryLiteral: ("first_name","TBUser100"),("last_name","Reddy"),("department","QA"),("job_title","ABCD"),("email_address","TBUser989.Reddy@xanadufinancials.com"),("employee_type","Internal"),("location","Bangalore")))
        
        UsersList.sharedUsersList.usersArray = [Users(json:json1),Users(json:json2)]
        
        //when
        let filterInfoDict = filterListController.initializeFilterDataSource()
        
        //then
        XCTAssertTrue(filterInfoDict.keys.count == 4,"There should be 4 main category")
        XCTAssertTrue(filterInfoDict[SearchFilterEnum.department("")]?.count == 1, "There should only be one department")
        XCTAssertTrue(filterInfoDict[SearchFilterEnum.jobtitle("")]?.count == 2,"There should be two job title")
        XCTAssertTrue(filterInfoDict[SearchFilterEnum.location("")]?.count == 2,"There should be 2 locations")
        XCTAssertTrue(filterInfoDict[SearchFilterEnum.type("")]?.count == 1,"There should be 1 type of job")
    }
}
