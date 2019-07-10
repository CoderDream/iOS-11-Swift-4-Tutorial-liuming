//
//  ViewController.swift
//  Todo
//
//  Created by CoderDream on 2019/7/9.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    //let defaults = UserDefaults.standard
    
    //var itemArray = ["购买水杯", "吃药", "修改密码"]
    //var itemArray = ["购买水杯", "吃药", "修改密码", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m","n", "o", "p"]
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedCategory: Category? {
        didSet {
            //loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
//            itemArray = items
//        }
        
//        let newItem = Item()
//        newItem.title = "购买水杯"
//        itemArray.append(newItem)
//
//        let newItem2 = Item()
//        newItem2.title = "吃药"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "修改密码"
//        itemArray.append(newItem3)
//
//        // 再向itemArray数组中添加117个newItem
//        for index in 4 ... 120 {
//            let newItem = Item()
//            newItem.title = "第\(index)件事务"
//            itemArray.append(newItem)
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
        cell.textLabel?.text = itemArray[indexPath.row].title
        
//        if itemArray[indexPath.row].done == false {
//            cell.accessoryType = .none
//        }else {
//            cell.accessoryType = .checkmark
//        }
        let item = itemArray[indexPath.row]
        cell.accessoryType = item.done == true ? .checkmark : .none
        
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
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
//
//
//        tableView.beginUpdates()
//        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
//        tableView.endUpdates()
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        let title = itemArray[indexPath.row].title
        //itemArray[indexPath.row].setValue(title! + " - (已完成)", forKey: "title")
        
        self.saveItems()
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
        tableView.endUpdates()
        
        // 当用户单击单元格以后，被选中的单元格就会呈现灰色的高亮状态
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 删除
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
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
            //let newItem = Item() // 创建Item类型对象
            
            // 用户单击添加项目按钮以后要执行的代码
            //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            //let newItem = Item(context: context)
            //let newItem = Item(context: self.context)
            
           // newItem.title = textField.text!    // 设置title属性
            //newItem.done = false                // 让 done 属性的默认值为false
            
            // 将selectedCategory的值赋给Item对象的parentCategory关系属性
           // newItem.parentCategory = self.selectedCategory
            
           // self.itemArray.append(newItem)     // 将newItem添加到itemArray数组之中
            // 保存到defaults中
            // self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
//            // 使用Encoder
//            let encoder = PropertyListEncoder()
//            do {
//                let data = try encoder.encode(self.itemArray)
//                try data.write(to: self.dataFilePath!)
//            } catch {
//                print("编码错误：\(error)")
//            }
           // self.saveItems()
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
    
    func saveItems() {
        // 使用Encoder
        //let encoder = PropertyListEncoder()
        do {
            //let data = try encoder.encode(self.itemArray)
            //try data.write(to: self.dataFilePath!)
            //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            try self.context.save()
        } catch {
            print("编码错误：\(error)")
        }
    }
    
//    func loadItems() {
////        if let data = try? Data(contentsOf: dataFilePath!) {
////            // 使用Decoder
////            let decoder = PropertyListDecoder()
////            do {
////                itemArray = try decoder.decode([Item].self, from: data)
////            } catch {
////                print("编码错误：\(error)")
////            }
////        }
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        do {
//            itemArray = try self.context.fetch(request)
//        } catch {
//            print("从context获取数据错误：\(error)")
//        }
//    }
    // let request: NSFetchRequest = Item.fetchRequest()
    //func loadItems(with request: NSFetchRequest<Item> ) {
//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@",selectedCategory!.name! )
//
//        if let addtionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, addtionalPredicate])
//        } else {
//            request.predicate = categoryPredicate
//        }
//
//        do {
//            itemArray = try context.fetch(request)
//        } catch {
//            print("从context获取数据错误：\(error)")
//        }
//
//        tableView.reloadData()
//    }
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
//            itemArray = try self.context.fetch(request)
//            for item in itemArray {
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
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            //loadItems()
            DispatchQueue.main.async {
                // 隐藏输入框
                searchBar.resignFirstResponder()
            }
        }
    }
}
