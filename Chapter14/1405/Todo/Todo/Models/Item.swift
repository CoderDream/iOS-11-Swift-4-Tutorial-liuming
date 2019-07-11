//
//  Item.swift
//  Todo
//
//  Created by CoderDream on 2019/7/10.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date? // 用于保存Item对象的创建时间
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
