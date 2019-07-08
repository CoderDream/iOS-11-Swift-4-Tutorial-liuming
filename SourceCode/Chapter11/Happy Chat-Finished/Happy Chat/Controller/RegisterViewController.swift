//
//  RegisterViewController.swift
//  Happy Chat
//
//  Created by 刘铭 on 2018/2/13.
//  Copyright © 2018年 刘铭. All rights reserved.
//
import UIKit
import SVProgressHUD

class RegisterViewController: UIViewController {
  
  
  //Pre-linked IBOutlets
  @IBOutlet var nameTextfield: UITextField!
  @IBOutlet var passwordTextfield: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  
  @IBAction func registerPressed(_ sender: AnyObject) {
    
    SVProgressHUD.show()
    
    //TODO: Set up a new user on our Bomb database
    let user = BmobUser()
    user.username = nameTextfield.text!
    user.password = passwordTextfield.text!
    
    user.signUpInBackground() { (isSuccessful, error) in
      if isSuccessful {
        print("注册成功")
        SVProgressHUD.dismiss()
        self.performSegue(withIdentifier: "goToChat", sender: self)
      }else{
        print("注册失败，错误原因：\(error!.localizedDescription)")
      }
    }
  }
  
  
}
