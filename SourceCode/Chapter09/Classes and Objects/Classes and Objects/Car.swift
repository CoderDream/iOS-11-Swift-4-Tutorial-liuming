//
//  Car.swift
//  Classes and Objects
//
//  Created by 刘铭 on 2018/2/2.
//  Copyright © 2018年 刘铭. All rights reserved.
//

import Foundation

enum CarType {
  case Sedan
  case Coupe
  case Hatchback
}

class Car {
  
  var colour = "Black"
  var numberOfSeats: Int = 5
  var typeOfCar: CarType = .Coupe
  
  init() {
  }
  
  convenience init(customerChosenColour: String) {
    self.init()
    colour = customerChosenColour
  }
  
  func drive() {
    print("汽车已经开动")
  }
}
