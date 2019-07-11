//
//  ViewController.swift
//  Todo
//
//  Created by CoderDream on 2019/7/9.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift

class TodoListViewController: UITableViewController {
    
    //let defaults = UserDefaults.standard
    
    //var todoItems = ["购买水杯", "吃药", "修改密码"]
    //var todoItems = ["购买水杯", "吃药", "修改密码", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m","n", "o", "p"]
    //var todoItems = [Item]()
    var todoItems: Results<Item>?
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
//            todoItems = items
//        }
        
//        let newItem = Item()
//        newItem.title = "购买水杯"
//        todoItems.append(newItem)
//
//        let newItem2 = Item()
//        newItem2.title = "吃药"
//        todoItems.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "修改密码"
//        todoItems.append(newItem3)
//
//        // 再向todoItems数组中添加117个newItem
//        for index in 4 ... 120 {
//            let newItem = Item()
//            newItem.title = "第\(index)件事务"
//            todoItems.append(newItem)
//        }
        //let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        //print("\(String(describing: dataFilePath))")
        // Optional(file:///var/mobile/Containers/Data/Application/4EE66D4B-9ED8-4520-AE48-D02A1AEB43C9/Documents/)

        //print("\(String(describing: dataFilePath))")
//        let request: NSFetchRequest = Item.fetchRequest()
//        loadItems(with: request)
        //loadItems()
    }
    
    //MARK: - Table View DataSource methods
    override func tableView(_  tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for:indexPath)
        //cell.textLabel?.text = todoItems[indexPath.row].title
        
//        if todoItems[indexPath.row].done == false {
//            cell.accessoryType = .none
//        }else {
//            cell.accessoryType = .checkmark
//        }
        //let item = todoItems[indexPath.row]
        //cell.accessoryType = item.done == true ? .checkmark : .none
        
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done == true ? .checkmark : .none
        } else {
            cell.textLabel?.text = "没有事项"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    //MARK: - Table View Delegate methods
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
//        print(indexPath.row)
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        //print(todoItems[indexPath.row])
        //
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
//        if todoItems[indexPath.row].done == false {
//            todoItems[indexPath.row].done = true
//        } else {
//            todoItems[indexPath.row].done = false
//        }
//
//
//        tableView.beginUpdates()
//        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
//        tableView.endUpdates()
        
        //todoItems[indexPath.row].done = !todoItems[indexPath.row].done
        
        //let title = todoItems[indexPath.row].title
        //todoItems[indexPath.row].setValue(title! + " - (已完成)", forKey: "title")
        
        //self.saveItems()
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
                    //realm.delete(item) // MRAK: - TODO 删除程序崩溃
                }
            } catch {
                print("保存完成状态失败：\(error)")
            }
        }
        
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
        tableView.endUpdates()
        
        // 当用户单击单元格以后，被选中的单元格就会呈现灰色的高亮状态
        //tableView.deselectRow(at: indexPath, animated: true)
        
        // 删除
//        context.delete(todoItems[indexPath.row])
//        todoItems.remove(at: indexPath.row)
    }
    
    //MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // 声明一个新的变量，生存期在方法的内部
        var textField = UITextField()
        
        let alert = UIAlertController(title: "添加一个新的ToDo项目", message: "",preferredStyle: .alert)
        
        let action = UIAlertAction(title: "添加项目", style: .default) { (action) in
            // 用户单击添加项目按钮以后要执行的代码
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date() // Date() 会返回当前时间
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("保存Item发生错误：\(error)")
                }
            }
             
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
    
//    func saveItems() {
//        // 使用Encoder
//        //let encoder = PropertyListEncoder()
//        do {
//            //let data = try encoder.encode(self.todoItems)
//            //try data.write(to: self.dataFilePath!)
//            //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//            //try self.context.save()
//        } catch {
//            print("编码错误：\(error)")
//        }
//    }
    
    func loadItems() {
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
    }

}

extension TodoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //let request: NSFetchRequest<Item> = Item.fetchRequest()
//        let predicate = NSPredicate(format: "title CONTAINS[c] %@", searchBar.text!)
//        request.predicate = predicate
//
//        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
//        request.sortDescriptors = [sortDescriptor]
//
//        do {
//            todoItems = try self.context.fetch(request)
//            for item in todoItems {
//                print("item.title: \(String(describing: item.title))")
//            }
//        } catch {
//            print("从context获取数据错误：\(error)")
//        }
//
//        tableView.reloadData()
//
//        print(searchBar.text!)
        
        //request.predicate  =  NSPredicate(format: "title CONTAINS[c] %@",  searchBar.text! )
        print(searchBar.text!)
        //request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        //loadItems(with: request)
        //todoItems = todoItems?.filter("title CONTAINS[c] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: false)
        
        todoItems = todoItems?.filter("title CONTAINS[c] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: false)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                // 隐藏输入框
                searchBar.resignFirstResponder()
            }
        }
    }
}
