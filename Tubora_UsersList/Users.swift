//
//  Users.swift
//  Tubora_UsersList
//
//  Created by Developer on 20/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Users : JSONDecodable {
    let firstName : String!
    let lastName : String!
    let department : String!
    let jobTitle : String!
    let emailAddress : String!
    let employeeType : String!
    let location : String!
    
    init(json: JSON) {
        firstName = json["first_name"].stringValue
        lastName = json["last_name"].stringValue
        department = json["department"].stringValue
        jobTitle = json["job_title"].stringValue
        emailAddress = json["email_address"].stringValue
        employeeType = json["employee_type"].stringValue
        location = json["location"].stringValue
    }
}