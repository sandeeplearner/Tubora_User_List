//
//  FilterListViewControllerTests.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import XCTest
@testable import Tubora_UsersList

class FilterListViewControllerTests: XCTestCase {
    var filterListViewController : FiltersListViewController! = nil
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        filterListViewController = storyboard.instantiateViewControllerWithIdentifier("filterListViewController") as! FiltersListViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testViewDidLoad() {
        //when
        let _ = filterListViewController.view
        
        //then
        XCTAssertNotNil(filterListViewController.filterListController,"Controller instance can not be nil")
    }
    
    func testFindAndExpandSectionForUserSelectedFilterCalledOnLoad() {
        //given
        let filterListViewControllerMock = FilterListViewControllerMock()
        filterListViewControllerMock.userSelectedFilter = SearchFilterEnum.department("QA")
        
        //when
        let _ = filterListViewControllerMock.view
        
        //then
        XCTAssertTrue(filterListViewControllerMock.findAndExpandSectionCalled,"Find and Expand section should be called")
    }
}
