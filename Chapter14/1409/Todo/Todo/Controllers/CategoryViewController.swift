//
//  CategoryViewController.swift
//  Todo
//
//  Created by CoderDream on 2019/7/10.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit
import ChameleonFramework

class CategoryViewController: UITableViewController {
    
    //var categories = [Category]()
    var categories: Results<Category>?
    
    let realm = try! Realm() // getRealmInstanc()
    
//    func getRealmInstanc() -> Realm {
//        do {
//            let a = try Realm()
//            return a
//        } catch {
//            print("error: \(error)")
//            // return
//        }
//    }
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100.0

        loadCategories()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        //print("addButtonPressed")
        let alert = UIAlertController(title: "添加新的类别", message: "",preferredStyle: .alert)
        let action = UIAlertAction(title: "添加", style: .default) { (action) in
//            let newCategory = Category(context: self.context)
//            newCategory.name = textField.text!
//            self.categories.append(newCategory)
//            self.saveCategories()
            //print("添加 action")
            let newCategory = Category()
            newCategory.name = textField.text!
            // 设置颜色
            newCategory.colour = UIColor.randomFlat.hexValue()
            //self.categories.append(newCategory)
            self.save(category: newCategory)
        }
        
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "添加一个新的类别"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Table View 数据维护方法
    
//    func saveCategories() {
//        do {
//            try context.save()
//        } catch {
//            print("保存Category错误：\(error)")
//        }
//        tableView.reloadData()
//    }
    func save(category: Category) {
        //print("save:category")
        do {
            try realm.write {
                //print("realm.write")
                realm.add(category)
            }
        } catch {
            print("保存Category错误：\(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
//        let request: NSFetchRequest<Category> = Category.fetchRequest()
//        do {
//            categories = try context.fetch(request)
//        } catch {
//            print("载入Category错误：\(error)")
//        }
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }

    // MARK: - Table View Data Source方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for:indexPath) as! SwipeTableViewCell
        cell.delegate = self
        cell.textLabel?.text = categories?[indexPath.row].name ?? "没有任何类别"
        
        guard let categoryColour = UIColor(hexString: categories?[indexPath.row].colour ?? "1D9BF6") else {
            fatalError()
        }
        
        cell.textLabel?.textColor = ContrastColorOf(categoryColour, returnFlat: true)
        cell.backgroundColor = categoryColour
        
        // cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].colour ?? "1D9BF6") // UIColor.randomFlat
        print("name: \(String(describing: cell.textLabel?.text))")
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        let destinationVC = segue.destination as! TodoListViewController
        if segue.identifier == "goToItems" {
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedCategory = categories?[indexPath.row]
            }
        }
    }
}

// MARK: - Swipe Cell Delegate Methods
extension CategoryViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else {
            return nil
        }
        
        let deleteAction = SwipeAction(style: .destructive, title: "删除") { (action, indexPath) in
            // handle action by updating model with deletion
            print("类别被删除")
            if let categoryForDeletion = self.categories?[indexPath.row] {
                do {
                    try self.realm.write {
                        self.realm.delete(categoryForDeletion)
                    }
                } catch {
                    print("删除类别失败： \(error)")
                }
                // tableView.reloadData()
            }
        }
        // customize the action appearance
        deleteAction.image = UIImage(named: "Trash-Icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeTableOptions()
        options.expansionStyle = .destructive
        return options
    }
}
