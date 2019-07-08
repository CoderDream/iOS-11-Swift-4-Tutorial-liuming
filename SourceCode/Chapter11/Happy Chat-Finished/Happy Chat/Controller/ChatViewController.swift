//
//  ViewController.swift
//  Happy Chat
//
//  Created by 刘铭 on 2018/2/13.
//  Copyright © 2018年 刘铭. All rights reserved.
//

import UIKit
import SwiftyJSON
import ChameleonFramework

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, BmobEventDelegate {
  
  // Declare instance variables here
  var messageArray: [Message] = [Message]()
  
  // We've pre-linked the IBOutlets
  @IBOutlet var heightConstraint: NSLayoutConstraint!
  @IBOutlet var sendButton: UIButton!
  @IBOutlet var messageTextfield: UITextField!
  @IBOutlet var messageTableView: UITableView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //TODO: Set yourself as the delegate and datasource here:
    messageTableView.delegate = self
    messageTableView.dataSource = self
    
    
    //TODO: Set yourself as the delegate of the text field here:
    messageTextfield.delegate = self
    
    
    //TODO: Set the tapGesture here:
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
    messageTableView.addGestureRecognizer(tapGesture)
    
    
    //TODO: Register your MessageCell.xib file here:
    messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
    
    configureTableView()
    
    listen()
    
    messageTableView.separatorStyle = .none
  }
  
  ///////////////////////////////////////////
  
  //MARK: - TableView DataSource Methods
  
  //TODO: Declare cellForRowAtIndexPath here:
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
    
    cell.messageBody.text = messageArray[indexPath.row].messageBody
    cell.senderUsername.text = messageArray[indexPath.row].sender
    cell.avatarImageView.image = UIImage(named: "egg")
    
    if cell.senderUsername.text == BmobUser.current().username {
      cell.avatarImageView.backgroundColor = UIColor.flatMint()
      cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
    }else {
      cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
      cell.messageBackground.backgroundColor = UIColor.flatGray()
    }
    
    return cell
  }
  
  
  //TODO: Declare numberOfRowsInSection here:
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messageArray.count
  }
  
  
  
  //TODO: Declare tableViewTapped here:
  @objc func tableViewTapped() {
    messageTextfield.endEditing(true)
  }
  
  
  //TODO: Declare configureTableView here:
  func configureTableView() {
    messageTableView.rowHeight = UITableViewAutomaticDimension
    messageTableView.estimatedRowHeight = 120.0
  }
  
  
  ///////////////////////////////////////////
  
  //MARK:- TextField Delegate Methods
  
  //TODO: Declare textFieldDidBeginEditing here:
  func textFieldDidBeginEditing(_ textField: UITextField) {
    UIView.animate(withDuration: 0.5, animations: {
      self.heightConstraint.constant = 348
      self.view.layoutIfNeeded()
    })
  }
  
  
  
  //TODO: Declare textFieldDidEndEditing here:
  func textFieldDidEndEditing(_ textField: UITextField) {
    UIView.animate(withDuration: 0.5) {
      self.heightConstraint.constant = 50
      self.view.layoutIfNeeded()
    }
  }
  
  
  ///////////////////////////////////////////
  
  
  //MARK: - Send & Recieve from Firebase

  @IBAction func sendPressed(_ sender: AnyObject) {
    messageTextfield.endEditing(true)
    
    //TODO: Send the message to Bmob and save it in our database
    messageTextfield.isEnabled = false
    sendButton.isEnabled = false
    
    let user = BmobUser.current()
    
    let chatMessage = BmobObject(className: "Message")
    chatMessage?.setObject(user?.username, forKey: "Sender")
    chatMessage?.setObject(messageTextfield.text, forKey: "MessageBody")
    
    chatMessage?.saveInBackground{ (isSuccessed, error) in
      if error != nil {
        //发生错误后的动作
        print("error is \(error!.localizedDescription)")
      }else{
        print("聊天信息存储云端成功")
        self.messageTextfield.isEnabled = true
        self.sendButton.isEnabled = true
        self.messageTextfield.text = ""
      }
    }
  }
  
  //TODO: Setup the listen method here:
  func listen() {
    let event = BmobEvent.default()
    if let event = event {
      event.delegate = self
      event.start()
    }
  }
  
  
  ///////////////////////////////////////////
  
  //MARK:- BmobEvent Delegate Methods
  
  func bmobEventDidConnect(_ event: BmobEvent!) {
    print(event.description)
  }
  
  func bmobEventCanStartListen(_ event: BmobEvent!) {
    event.listenTableChange(BmobActionTypeUpdateTable, tableName: "Message")
  }
  
  func bmobEvent(_ event: BmobEvent!, didReceiveMessage message: String!) {
    let messageJSON: JSON = JSON(parseJSON: message)
    print(messageJSON)
    
    let text = messageJSON["data"]["MessageBody"]
    let sender = messageJSON["data"]["Sender"]
    
    let message: Message = Message()
    message.messageBody = text.stringValue
    message.sender = sender.stringValue
    
    self.messageArray.append(message)
    self.configureTableView()
    self.messageTableView.reloadData()
  }
  
  func bmobEvent(_ event: BmobEvent!, error: Error!) {
    print(error.localizedDescription)
  }
  
  func bmobEventDidDisConnect(_ event: BmobEvent!, error: Error!) {
    print(error.localizedDescription)
  }
  
  
  @IBAction func logOutPressed(_ sender: AnyObject) {
    
    //TODO: 退出并回到 WelcomeViewController
    BmobUser.logout()
    navigationController?.popToRootViewController(animated: true)
  }
  
  
  
}
