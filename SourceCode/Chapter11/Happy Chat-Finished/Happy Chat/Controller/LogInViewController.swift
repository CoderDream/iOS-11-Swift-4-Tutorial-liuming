//
//  LogInViewController.swift
//  Happy Chat
//
//  Created by 刘铭 on 2018/2/13.
//  Copyright © 2018年 刘铭. All rights reserved.
//

import UIKit
import SVProgressHUD

class LogInViewController: UIViewController {
  
  //Textfields pre-linked with IBOutlets
  @IBOutlet var nameTextfield: UITextField!
  @IBOutlet var passwordTextfield: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  @IBAction func logInPressed(_ sender: AnyObject) {
    SVProgressHUD.show()
    BmobUser.loginWithUsername(inBackground: nameTextfield.text!, password: passwordTextfield.text!) { (user, error) in
      if error != nil {
        print(error!.localizedDescription)
      }else {
        print("登陆成功")
        SVProgressHUD.dismiss()
        self.performSegue(withIdentifier: "goToChat", sender: self)
      }
    }
  }
  
  
  
  
}  
