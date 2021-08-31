//
//  CategoriesViewController.swift
//  CountdownDate
//
//  Created by Yu-Hsuan Huang on 2021/8/3.
//

import UIKit
import CoreData

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Core data presistent
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //UI Objects
    @IBOutlet weak var tableView: UITableView!
    
    //data
    var categories:[Category]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Set background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "patrick-tomasso-Y4AZPOnE6ZI-unsplash.jpg")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        //get all categories
        self.fetchCategories()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Fetch all categories
    func fetchCategories() {
        //Fetch the data from Core Data to display in the tableView
        do {
            //request and sort
            let request = Category.fetchRequest() as NSFetchRequest<Category>
            let sort = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sort]
            
            self.categories = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {}
    }

    //MARK: Fetch the events by category
    func fetchEvents(category: String) -> [Event]? {
        //request and predicate
        let request = Event.fetchRequest() as NSFetchRequest<Event>
        let pred = NSPredicate(format: "category == %@", category)
        request.predicate = pred
        
        //Fetch the data from Core Data
        do {
            return try context.fetch(request)
        } catch {}
        
        return nil
    }

    //MARK: Add a new category
    @IBAction func addCategory(_ sender: Any) {
        //Creat a alert
        let alert = UIAlertController(title: "Add Category", message: "What is your category for events?", preferredStyle: .alert)
        //add a text field
        alert.addTextField()
        
        //create submit button action
        let submitButton = UIAlertAction(title: "Add", style: .default) {
            (action) in
            let textField = alert.textFields![0]
            
            //create a new Category
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            //save a new category
            do {
                try self.context.save()
            } catch {}
            
            //re-fetch categories
            self.fetchCategories()
        }
        //create cancel button without action
        let cancelButton = UIAlertAction(title: "Cancel", style: .default)
        
        //all alert action to alert
        alert.addAction(submitButton)
        alert.addAction(cancelButton)
        //show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Table view functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns how many rows in the table
        return categories?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell")
        
        //set cell content
        let category = self.categories![indexPath.row]
        categoryCell?.textLabel?.text = category.name
        
        // returns the cell
        return categoryCell!
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //when swipe row
        
        //create contextual action to delete category
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            let categoryToRemove = self.categories![indexPath.row]
            
            //delete and save
            self.context.delete(categoryToRemove)
            do {
                try self.context.save()
            } catch {}
            
            //re-fetch
            self.fetchCategories()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //when select the row
        
        let categoryToEdit = self.categories![indexPath.row]
        
        //create a alert to make the category change
        let alert = UIAlertController(title: "Edit Category", message: "Edit category name?", preferredStyle: .alert)
        alert.addTextField()
        
        let textField = alert.textFields![0]
        textField.text = categoryToEdit.name
        
        let submitButton = UIAlertAction(title: "Save", style: .default) {
            (action) in
            
            //change all relative event
            let events = self.fetchEvents(category: categoryToEdit.name!)
            if(events != nil) {
                for event in events! {
                    event.category = textField.text
                }
            }

            //change category and save
            categoryToEdit.name = textField.text
            do {
                try self.context.save()
            } catch {}
            
            //re-fetch
            self.fetchCategories()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default)

        //set alert action to alert, then show alert
        alert.addAction(submitButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
