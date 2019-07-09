//
//  ViewController.swift
//  Todo
//
//  Created by CoderDream on 2019/7/9.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["购买水杯", "吃药", "修改密码"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Table View DataSource methods
    override func tableView(_  tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for:indexPath)
        cell.textLabel? .text = itemArray[indexPath.row]
        
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
            self.itemArray.append(textField.text! )
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

