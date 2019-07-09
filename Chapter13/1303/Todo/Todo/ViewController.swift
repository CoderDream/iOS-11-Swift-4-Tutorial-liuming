//
//  ViewController.swift
//  Todo
//
//  Created by CoderDream on 2019/7/9.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    
    //var itemArray = ["购买水杯", "吃药", "修改密码"]
    //var itemArray = ["购买水杯", "吃药", "修改密码", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m","n", "o", "p"]
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
//            itemArray = items
//        }
        
        let newItem = Item()
        newItem.title = "购买水杯"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "吃药"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "修改密码"
        itemArray.append(newItem3)
        
        // 再向itemArray数组中添加117个newItem
        for index in 4 ... 120 {
            let newItem = Item()
            newItem.title = "第\(index)件事务"
            itemArray.append(newItem)
        }
    }
    
    //MARK: - Table View DataSource methods
    override func tableView(_  tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for:indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done == false {
            cell.accessoryType = .none
        }else {
            cell.accessoryType = .checkmark // MARK: TODO 点击事件有问题
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return itemArray.count
    }
    
    //MARK: - Table View Delegate methods
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
//        print(indexPath.row)
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        print(itemArray[indexPath.row])
        //
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
        tableView.endUpdates()
        
        // 当用户单击单元格以后，被选中的单元格就会呈现灰色的高亮状态
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // 声明一个新的变量，生存期在方法的内部
        var textField = UITextField()
        
        let alert = UIAlertController(title: "添加一个新的ToDo项目", message: "",preferredStyle: .alert)
        
        let action = UIAlertAction(title: "添加项目", style: .default) { (action) in
            // 用户单击添加项目按钮以后要执行的代码
            //self.itemArray.append(textF)
            //print("成功！")
            //self.itemArray.append(textField.text!)
            
            // 用户单击添加项目按钮以后要执行的代码
            let newItem = Item() // 创建Item类型对象
            newItem.title = textField.text!    // 设置title属性
            
            self.itemArray.append(newItem)     // 将newItem添加到itemArray数组之中
            // 保存到defaults中
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
            print(textField.text!)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "创建一个新项目．.."
            print(alertTextField.text! )
            // 让textField指向alertTextField，因为出了闭包，alertTextField不存在
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

