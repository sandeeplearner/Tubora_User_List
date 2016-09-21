//
//  JSONDecodable.swift
//  Tubora_UsersList
//
//  Created by Developer on 20/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONDecodable {
    init(json : JSON)
}