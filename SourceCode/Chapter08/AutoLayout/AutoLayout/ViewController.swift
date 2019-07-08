//
//  ViewController.swift
//  AutoLayout
//
//  Created by 刘铭 on 2018/1/28.
//  Copyright © 2018年 刘铭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let square = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    let x = self.view.frame.width / 2 - square.frame.width / 2
    let y = self.view.frame.height / 2 - square.frame.width / 2
    
    square.frame.origin = CGPoint(x: x, y: y)
    
    square.backgroundColor = UIColor.red
    self.view.addSubview(square)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

