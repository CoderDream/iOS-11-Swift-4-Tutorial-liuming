//
//  CategoryViewController.swift
//  Todo
//
//  Created by CoderDream on 2019/7/10.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    
    let realm = try! Realm()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "添加新的类别", message: "",preferredStyle: .alert)
        let action = UIAlertAction(title: "添加", style: .default) { (action) in
//            let newCategory = Category(context: self.context)
//            newCategory.name = textField.text!
//            self.categories.append(newCategory)
//            self.saveCategories()
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
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
        do {
            try realm.write {
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
        tableView.reloadData()
    }

    // MARK: - Table View Data Source方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for:indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
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
                destinationVC.selectedCategory = categories[indexPath.row]
            }
        }
    }
}
