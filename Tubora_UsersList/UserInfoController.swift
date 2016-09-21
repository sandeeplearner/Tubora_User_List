//
//  UserInfoController.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import Foundation

class UserInfoController {
    func removeTheProperty(fromUser user : Users, forSelectedFilter selectedFilter : SearchFilterEnum) -> [String : String]{
        var processedUserInfoDictionary = [String : String]()
        var mirroredObjectOfPassedUser : _MirrorType!
        mirroredObjectOfPassedUser = _reflect(user)
        let propertyToBeIgnored = self.findUserPropertyToIgnore(forSelectedFilter: selectedFilter)
        
        for i in 0 ..< mirroredObjectOfPassedUser.count {
            let (propertyname,propertyValue) = mirroredObjectOfPassedUser[i]
            if propertyToBeIgnored != propertyname {
                processedUserInfoDictionary[propertyname] = propertyValue.value as? String
            }
        }
        return processedUserInfoDictionary
    }
    
    func findUserPropertyToIgnore(forSelectedFilter selectedFilter : SearchFilterEnum) -> String {
        var propertyToBeIgnored : String!
        
        switch selectedFilter {
        case .department(_):
            propertyToBeIgnored = "department"
        case .jobtitle(_):
            propertyToBeIgnored = "jobTitle"
        case .location(_):
            propertyToBeIgnored = "location"
        case .type(_):
            propertyToBeIgnored = "employeeType"
        }
        return propertyToBeIgnored
    }
}