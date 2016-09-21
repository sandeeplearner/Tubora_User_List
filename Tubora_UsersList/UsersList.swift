//
//  UsersList.swift
//  Tubora_UsersList
//
//  Created by Developer on 20/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import Foundation
import SwiftyJSON
import MBProgressHUD

class UsersList {
    static var sharedUsersList = UsersList()
    var usersArray = [Users]()
    
    private init() {
        //no need to implement anything in here
    }
    
    func initializeUsersArray() {
        let hud = MBProgressHUD.showHUDAddedTo(UIApplication.sharedApplication().keyWindow!, animated: true)
        hud.label.text = "Initializing..."
        
        let filePath = NSBundle.mainBundle().pathForResource("Users", ofType: ".json")
        let data = try! NSData(contentsOfFile: filePath!, options: NSDataReadingOptions.DataReadingMappedAlways)
        let parsedJson = JSON(data: data)
        guard parsedJson.array != nil else {
            return
        }
        for userInfo in parsedJson.array! {
            let user = Users(json: userInfo)
            self.usersArray.append(user)
        }
         MBProgressHUD.hideHUDForView(UIApplication.sharedApplication().keyWindow!, animated: true)
    }
}