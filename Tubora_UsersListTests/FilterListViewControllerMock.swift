//
//  FilterListViewControllerMock.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import Foundation
@testable import Tubora_UsersList

class FilterListViewControllerMock : FiltersListViewController {
    var findAndExpandSectionCalled = false
    
    override func findAndExpandSectionForUserSelectedFilter() {
        findAndExpandSectionCalled = true
    }
}