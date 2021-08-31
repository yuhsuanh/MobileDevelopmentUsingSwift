//
//  CreationViewController.swift
//  CountdownDate
//
//  Created by Yu-Hsuan Huang on 2021/7/22.
//

import UIKit
import CoreData

class CreationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Core data persistent
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //screen size for picker
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 4
    var selectedRow = 0

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
    
    var categories:[Category]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //set up background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "patrick-tomasso-Y4AZPOnE6ZI-unsplash.jpg")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        //get all categories
        fetchCategories();
        
        //if no category, show alert and back to previous page
        if(categories.isEmpty) {
            let alert = UIAlertController(title: "ERROR", message: "You should add CATEGORY first.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {(UIAlertAction) in
                _ = self.navigationController?.popViewController(animated: false)
            }))
            self.present(alert, animated: true, completion: nil)
        }
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
    
    //MARK: Fetch the top event
    func fetchTopEvent() -> Event? {
        //init
        var topEvent: Event? = nil
        
        //request and predicate
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
    
    //MARK: Save the new event
    @IBAction func saveEvent(_ sender: Any) {
        //check the fields
        if(!checkInputData()) {
            return
        }
        
        //set new event
        let newEvent = Event(context: self.context)
        
        newEvent.eventName = textFieldEventName.text
        newEvent.desc = textFieldDesc.text
        newEvent.startDate = datePickerStartDate.date
        newEvent.eventEnd = switchEventEnd.isOn
        newEvent.category = buttonCategory.titleLabel!.text
        //Set event date, if event end is on
        if(switchEventEnd.isOn) {
            newEvent.endDate = datePickerEndDate.date
        } else {
            newEvent.endDate = Date()
        }
        
        //set event.top
        let topEvent = self.fetchTopEvent()
        
        if (topEvent == nil) {
            //if no top event, this event will be top event
            newEvent.top = true
        } else if (topEvent!.top && switchTopEvent.isOn) {
            //if has top event, this event will be top event and old top event will remove top
            topEvent!.top = false
            newEvent.top = true
        } else {
            newEvent.top = false
        }
        
        //save all changes
        do {
            try self.context.save()
        } catch {}
        
        //redirect to previous page
        _ = navigationController?.popViewController(animated: false)
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
