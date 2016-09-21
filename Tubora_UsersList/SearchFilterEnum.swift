//
//  SearchFilterEnum.swift
//  Tubora_UsersList
//
//  Created by Developer on 20/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

func ==(lhs: SearchFilterEnum, rhs: SearchFilterEnum) -> Bool {
    return lhs.stringValueOfEnumKeys().hashValue == rhs.stringValueOfEnumKeys().hashValue
}

enum SearchFilterEnum : Hashable {
    case department(String)
    case location(String)
    case jobtitle(String)
    case type(String)
    
    var hashValue : Int {
        get {
            return self.hashGenerator()
        }
    }
    
    func searchFilterDescription() -> String {
        switch self {
        case .department(let departmentName):
            return "Department -> \(departmentName)"
        case .jobtitle(let jobTitle):
            return "Job title -> \(jobTitle)"
        case .location(let location):
            return "Location \(location)"
        case .type(let employeeType):
            return "Employee type -> \(employeeType)"
        }
    }
    
    private func hashGenerator() -> Int {
        switch self {
        case .department(let departmentName):
            return "Department -> \(departmentName)".hashValue
        case .jobtitle(let jobTitle):
            return "Job title -> \(jobTitle)".hashValue
        case .location(let location):
            return "Location \(location)".hashValue
        case .type(let employeeType):
            return "Employee type -> \(employeeType)".hashValue
        }
    }
    
    func stringValueOfEnumKeys() -> String {
        switch self {
        case .department:
            return "DEPARTMENT"
        case .jobtitle:
            return "JOB TITLE"
        case .location:
            return "LOCATION"
        case .type:
            return "EMPLOYEE TYPE"
        }
    }
    
    func getAscociatedValue() -> String {
        switch self {
        case .department(let department):
            return department
        case .jobtitle(let jobTitle):
            return jobTitle
        case .location(let location):
            return location
        case .type(let type):
            return type
        }
    }
}