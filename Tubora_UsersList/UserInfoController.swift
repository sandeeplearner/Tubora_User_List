//
//  UserInfoController.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import Foundation

class UserInfoController {
    func removeTheProperty(fromUser user : Users, forSelectedFilter selectedFilter : SearchFilterEnum) -> [(String,String)]{
        var processedUserInfoDictionary = [String : String]()
        var mirroredObjectOfPassedUser : _MirrorType!
        mirroredObjectOfPassedUser = _reflect(user)
        let propertyToBeIgnored = self.findUserPropertyToIgnore(forSelectedFilter: selectedFilter)
        
        for i in 0 ..< mirroredObjectOfPassedUser.count {
            let (propertyname,propertyValue) = mirroredObjectOfPassedUser[i]
            if propertyToBeIgnored != propertyname {
                processedUserInfoDictionary[self.displayLabelTextForProperty(propertyname)] = propertyValue.value as? String
            }
        }
        let sortedDict = processedUserInfoDictionary.sort{ $0.0.localizedCaseInsensitiveCompare($1.0) == .OrderedAscending }
        return sortedDict
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
    
    func displayLabelTextForProperty(property : String) -> String {
        let displayLabelText : String!
        switch property {
        case "department":
            displayLabelText = "Department"
        case "firstName":
            displayLabelText = "First Name"
        case "lastName":
            displayLabelText = "Last Name"
        case "jobTitle":
            displayLabelText = "Job Title"
        case "emailAddress":
            displayLabelText = "Email"
        case "employeeType":
            displayLabelText = "Employment Type"
        case "location":
            displayLabelText = "Location"
        default:
            displayLabelText = property
        }
        return displayLabelText
    }
}