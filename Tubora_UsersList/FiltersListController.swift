//
//  FiltersListController.swift
//  Tubora_UsersList
//
//  Created by Developer on 20/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import Foundation

class FiltersListController {
    func initializeFilterDataSource() -> [SearchFilterEnum : [String]] {
        var dataSource = [SearchFilterEnum : [String]]()
        dataSource[SearchFilterEnum.department("")] = Array(Set(UsersList.sharedUsersList.usersArray.map({$0.department})))
        dataSource[SearchFilterEnum.location("")] = Array(Set(UsersList.sharedUsersList.usersArray.map({$0.location})))
        dataSource[SearchFilterEnum.jobtitle("")] = Array(Set(UsersList.sharedUsersList.usersArray.map({$0.jobTitle})))
        dataSource[SearchFilterEnum.type("")] = Array(Set(UsersList.sharedUsersList.usersArray.map({$0.employeeType})))
        return dataSource
    }
}