//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by 铭刘 on 2018/2/3.
//  Copyright © 2018年 刘铭. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
  var destination: String?
  
  override func drive() {
    super.drive()
    
    if let userSetDestination = destination {
      print("驾驶的目的地为：" + userSetDestination)
    }
  }
}
