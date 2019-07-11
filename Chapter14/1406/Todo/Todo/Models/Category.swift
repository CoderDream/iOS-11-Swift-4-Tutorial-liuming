//
//  Category.swift
//  Todo
//
//  Created by CoderDream on 2019/7/10.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    
    let items = List<Item>()
}
