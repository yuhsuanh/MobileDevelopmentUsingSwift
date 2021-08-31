//
//  UpdateViewController.swift
//  CountdownDate
//
//  Created by Yu-Hsuan Huang on 2021/7/22.
//

import UIKit
import CoreData

class UpdateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Core data presistent
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //UI Objects
    @IBOutlet weak var textFieldEventName: UITextField!
    
    @IBOutlet weak var textFieldDesc: UITextField!
    
    @IBOutlet weak var datePickerStartDate: UIDatePicker!
    
    @IBOutlet weak var switchEventEnd: UISwitch!
    
    @IBOutlet weak var datePickerEndDate: UIDatePicker!
    
    @IBOutlet weak var buttonCategory: UIButton!
    
    @IBOutlet weak var switchTopEvent: UISwitch!
    
    @IBOutlet weak var stackViewEndDate: UIStackView!
    
    /*
    var categories =
    [
        "Anniversary",
        "Birthday",
        "Holiday",
        "Life",
        "Work",
        "Other",
    ]
    */
    
    //screen size for picker
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 4
    var selectedRow = 0
    
    //data
    var event: Event!
    var categories:[Category]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Set background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "patrick-tomasso-Y4AZPOnE6ZI-unsplash.jpg")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        //set navigation bar - title and right item button
        self.title = "Update Event"
        let saveButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.onSaveButtonClicked(_:)))
        self.navigationItem.rightBarButtonItem  = saveButtonItem
        
        //Set the event data to UI objects
        switchTopEvent.setOn(self.event.top, animated: true)
        textFieldEventName.text = self.event.eventName
        textFieldDesc.text = self.event.desc
        datePickerStartDate.date = self.event.startDate!
        switchEventEnd.setOn(self.event.eventEnd, animated: true)
        if(self.event.eventEnd) {
            datePickerEndDate.date = self.event.endDate!
        } else {
            //set end date is today, if no end date
            datePickerEndDate.date = Date()
            self.stackViewEndDate.isHidden = true
        }
        buttonCategory.setTitle(self.event.category, for: .normal)
        
        //get categories
        self.fetchCategories()
    }
    
    //MARK: Fetch all categories
    func fetchCategories() {
        do {
            //request and sort
            let request = Category.fetchRequest() as NSFetchRequest<Category>
            let sort = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sort]
            
            try self.categories = context.fetch(request)
        } catch {}
    }
    
    //MARK: Fetch top event
    func fetchTopEvent() -> Event? {
        var topEvent: Event? = nil
        
        //request and predicate(filter)
        let request = Event.fetchRequest() as NSFetchRequest<Event>
        let pred = NSPredicate(format: "top == %d", true)
        request.predicate = pred
        
        //Fetch the data from Core Data
        do {
            topEvent = try context.fetch(request).first ?? nil
        } catch {}
        
        return topEvent ?? nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: Pop up category picker
    @IBAction func popUpCategoryPicker(_ sender: Any) {
        //configere picker
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
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(UIAlertAction)in}))
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: {(UIAlertAction) in
            self.selectedRow = pickerView.selectedRow(inComponent: 0)
            let selected = self.categories[self.selectedRow].name
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
        categories.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        //row hight
        return 60
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //picker content
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        //Set category text
        label.text = categories[row].name
        label.sizeToFit()
        return label
    }
    
    //MARK: Update the event
    @objc func onSaveButtonClicked(_ sender: Any){
        //check the fields
        if(!checkInputData()) {
            return
        }
        
        self.event.eventName = textFieldEventName.text
        self.event.desc = textFieldDesc.text
        self.event.startDate = datePickerStartDate.date
        self.event.eventEnd = switchEventEnd.isOn
        self.event.category = buttonCategory.titleLabel?.text
        //Set event date, if event end is on
        if(switchEventEnd.isOn) {
            self.event.endDate = datePickerEndDate.date
        } else {
            self.event.endDate = Date()
        }
        
        //set top
        let topEvent = self.fetchTopEvent()
        if (topEvent == nil) {
            //if no top event, this event will be top event
            self.event.top = true
        } else if (topEvent!.top && switchTopEvent.isOn) {
            //if has top event, this event will be top event and old top event will remove top
            topEvent!.top = false
            self.event.top = true
        } else {
            self.event.top = false
        }
        
        //save all changes
        do {
            try self.context.save()
        } catch {}
        
        //redirect to root page
        _ = navigationController?.popToRootViewController(animated: false)
    }

    //MARK: Delete event button
    @IBAction func deleteEvent(_ sender: Any) {
        //delete event
        self.context.delete(self.event)
        
        //save chage
        do {
            try self.context.save()
        } catch {}
        
        //redirect to root page
        _ = navigationController?.popToRootViewController(animated: false)
    }
    
    //MARK: Click end date switch
    @IBAction func showEndDate(_ sender: UISwitch) {
        if sender.isOn {
            //show end date
            UIView.animate(withDuration: 0.25, animations: {
                self.stackViewEndDate.isHidden = false
                self.view.layoutIfNeeded()
            })
        } else {
            //hide end date
            UIView.animate(withDuration: 0.25, animations: {
                self.stackViewEndDate.isHidden = true
                self.view.layoutIfNeeded()
            })
        }
    }
    
    //MARK: Utility func - Check the event has needed data field
    func checkInputData() -> Bool {
        if (!textFieldEventName.hasText || "Select".compare(buttonCategory.titleLabel!.text!) == .orderedSame) {
            //Error alert
            let alert = UIAlertController(title: "ERROR", message: "You must enter EVENT NAME, Select START DATE and Select CATEGORY", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Okay", style: .default)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        return true
    }
    
}
