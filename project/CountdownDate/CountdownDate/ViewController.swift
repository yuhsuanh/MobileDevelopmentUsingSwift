//
//  ViewController.swift
//  CountdownDate
//
//  Created by Yu-Hsuan Huang on 2021/7/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //screen size for picker
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 4
    var selectedRow = 0
    
    
    //UI Objects
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var buttonCategory: UIButton!
    
    @IBOutlet weak var labelTopEventDays: UILabel!
    
    @IBOutlet weak var labelTopEventName: UILabel!
    
    @IBOutlet weak var labelTopEventDesc: UILabel!
    
    
    //managed object context //NSManagedObjectContext()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //Data
    var items:[Event]?
    var categories:[Category]!
    var topEvent: Event?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //configure table view
        tableView.dataSource = self
        tableView.delegate = self
        
        //configure background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "patrick-tomasso-Y4AZPOnE6ZI-unsplash.jpg")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        //load events, top event, categories
        //show top event on view
        fetchEvents()
        fetchTopEvent()
        fetchCategories()
        showTopEvent()
    }
    
    //MARK: Override view will appear func
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //set category title
        self.buttonCategory.setTitle("All", for: .normal)
        
        //load events, top event, categories
        //show top event on view
        fetchCategories()
        fetchEvents()
        fetchTopEvent()
        showTopEvent()
    }
    
    //MARK: Display top event to the view
    func showTopEvent() {
        //if no top event, use first event to dispaly in top
        if(topEvent != nil) {
            labelTopEventName.text = topEvent!.eventName
            labelTopEventDesc.text = topEvent!.desc
            //calculate how many days
            if(topEvent!.eventEnd) {
                labelTopEventDays.text = String(daysBetween(start: topEvent!.startDate!, end: topEvent!.endDate!))
            } else {
                labelTopEventDays.text = String(daysBetween(start: topEvent!.startDate!, end: Date()))
            }
        } else if (!items!.isEmpty) {
            labelTopEventName.text = items!.first!.eventName
            labelTopEventDesc.text = items!.first!.desc
            //calculate how many days
            if(items!.first!.eventEnd) {
                labelTopEventDays.text = String(daysBetween(start: items!.first!.startDate!, end: items!.first!.endDate!))
            } else {
                labelTopEventDays.text = String(daysBetween(start: items!.first!.startDate!, end: Date()))
            }
        }
    }
    
    //MARK: Fetch all events
    func fetchEvents() {
        //request
        let request = Event.fetchRequest() as NSFetchRequest<Event>
        
        //Fetch the data from Core Data to display in the tableView
        do {
            self.items = try context.fetch(request)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {}
    }
    
    //MARK: Fetch the events by category
    func fetchEvents(category: String) {
        //request
        let request = Event.fetchRequest() as NSFetchRequest<Event>
        //filter
        let pred = NSPredicate(format: "category == %@", category)
        request.predicate = pred
        
        //Fetch the data from Core Data to display in the tableView
        do {
            self.items = try context.fetch(request)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {}
    }
    
    //MARK: Fetch top event
    func fetchTopEvent() {
        //request and predicate(filter)
        let request = Event.fetchRequest() as NSFetchRequest<Event>
        let pred = NSPredicate(format: "top == %d", true)
        request.predicate = pred
        
        //Fetch the data from Core Data
        do {
            self.topEvent = try context.fetch(request).first ?? nil
        } catch {}
    }
    
    //MARK: Fetch the top event by category
    func fetchTopEvent(category: String) {
        //request and two predicates (filter)
        let request = Event.fetchRequest() as NSFetchRequest<Event>
        let pred1 = NSPredicate(format: "top == %d", true)
        let pred2 = NSPredicate(format: "category == %@", category)
        let predCompound = NSCompoundPredicate(andPredicateWithSubpredicates: [pred1, pred2])
        request.predicate = predCompound
        
        //Fetch the data from Core Data
        do {
            self.topEvent = try context.fetch(request).first ?? nil
        } catch {}
    }
    
    //MARK: Fetch all categories
    func fetchCategories() {
        do {
            //requset and sort
            let request = Category.fetchRequest() as NSFetchRequest<Category>
            let sort = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sort]
            
            try self.categories = context.fetch(request)
        } catch {}
    }



    //MARK: TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell: EventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventTableViewCell
        
        //get the row data from the events
        let event = self.items![indexPath.row]
        eventCell.labelEventname.text = event.eventName
        eventCell.labelDesc.text = event.desc
        eventCell.labelStartDate.text = convertDateToStringFormat(date: event.startDate!, format: "YYYY/MM/dd")
        //if event end is true, use end date to calculate the days. otherwise, use today to calculate the days
        if (event.eventEnd) {
            eventCell.labelDays.text = String(daysBetween(start: event.startDate!, end: event.endDate!))
        } else {
            eventCell.labelDays.text = String(daysBetween(start: event.startDate!, end: Date()))
        }
        
        return eventCell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController: DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //when row click, it will send the event to the detail view controller page
        let event = self.items![indexPath.row]
        detailViewController.event = event
        
        //redirect to detail page
        self.navigationController?.pushViewController(detailViewController, animated: false)
    }
    
    //MARK: Utility func - calculate days between two date
    func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
    
    //MARK: Utitity func - convert date type to formatted data string
    func convertDateToStringFormat(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    //MARK: Select category button, display different table cell in the view
    @IBAction func selectCategory(_ sender: UIButton) {
        //configure the picker
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        //alert
        let alert = UIAlertController(title: "Select Category", message: "", preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.sourceView = buttonCategory
        alert.popoverPresentationController?.sourceRect = buttonCategory.bounds
        
        alert.setValue(vc, forKey: "contentViewController")
        
        //add to action button to alert
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(UIAlertAction)in}))
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: {(UIAlertAction) in
            self.selectedRow = pickerView.selectedRow(inComponent: 0)
            var selected:String = ""
            if(self.selectedRow == 0) {
                selected = "All"
                self.fetchEvents()
                self.fetchTopEvent()
                self.showTopEvent()
            } else {
                selected = self.categories[self.selectedRow-1].name!
                self.fetchEvents(category: selected)
                self.fetchTopEvent(category: selected)
                self.showTopEvent()
            }
            self.buttonCategory.setTitle(selected, for: .normal)
        }))
        
        //show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Picker configuration
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //can select how many rows
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //picker total rows
        categories.count + 1
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        //row hight
        return 60
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //picker content
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        let tempRow = row - 1
        
        //add a category "All" at first
        if(tempRow == -1) {
            label.text = "All"
        } else {
            label.text = categories[tempRow].name
        }
        
        label.sizeToFit()
        return label
    }

}

