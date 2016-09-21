//
//  UsersListController.swift
//  Tubora_UsersList
//
//  Created by Developer on 20/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import Foundation

class UsersListController {
    func initializeDatSource(withCompletionBlock completionBlock : ()->()) {
        if UsersList.sharedUsersList.usersArray.count == 0 {
            UsersList.sharedUsersList.initializeUsersArray()
        }
        completionBlock()
    }
    
    func searchWithSearchCriteria(crieteria : SearchFilterEnum) -> [Users] {
        let filterredUsers = UsersList.sharedUsersList.usersArray.filter({
            switch crieteria {
            case .department(let departmentName) :
                return $0.department == departmentName
            case .jobtitle(let jobTitle) :
                return $0.jobTitle == jobTitle
            case .location(let location) :
                return $0.location == location
            case .type(let type) :
                return $0.employeeType == type
            }
        })
        return filterredUsers
    }
}