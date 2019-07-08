//
//  ViewController.swift
//  Happy Chat
//
//  Created by 刘铭 on 2018/2/13.
//  Copyright © 2018年 刘铭. All rights reserved.
//

import UIKit


class ChatViewController: UIViewController {
  
  // Declare instance variables here
  
  
  // We've pre-linked the IBOutlets
  @IBOutlet var heightConstraint: NSLayoutConstraint!
  @IBOutlet var sendButton: UIButton!
  @IBOutlet var messageTextfield: UITextField!
  @IBOutlet var messageTableView: UITableView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //TODO: Set yourself as the delegate and datasource here:
    
    
    
    //TODO: Set yourself as the delegate of the text field here:
    
    
    
    //TODO: Set the tapGesture here:
    
    
    
    //TODO: Register your MessageCell.xib file here:
    
    
  }
  
  ///////////////////////////////////////////
  
  //MARK: - TableView DataSource Methods
  
  //TODO: Declare cellForRowAtIndexPath here:
  
  
  
  //TODO: Declare numberOfRowsInSection here:
  
  
  
  //TODO: Declare tableViewTapped here:
  
  
  
  //TODO: Declare configureTableView here:
  
  
  
  ///////////////////////////////////////////
  
  //MARK:- TextField Delegate Methods
  
  //TODO: Declare textFieldDidBeginEditing here:
  
  
  
  
  //TODO: Declare textFieldDidEndEditing here:
  
  
  
  ///////////////////////////////////////////
  
  
  //MARK: - Send & Recieve from Firebase

  @IBAction func sendPressed(_ sender: AnyObject) {
    //TODO: Send the message to Bmob and save it in our database
    
    
  }
  
  //TODO: Create the listen method here:
  
  
  
  
  @IBAction func logOutPressed(_ sender: AnyObject) {
    
    //TODO: Log out the user and send them back to WelcomeViewController
    
    
  }
  
  
  
}
