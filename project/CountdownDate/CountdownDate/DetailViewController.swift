//
//  DetailViewController.swift
//  CountdownDate
//
//  Created by Yu-Hsuan Huang on 2021/7/22.
//

import UIKit

class DetailViewController: UIViewController {

    //UI Objects
    @IBOutlet weak var labelDays: UILabel!
    
    @IBOutlet weak var labelEventName: UILabel!
    
    @IBOutlet weak var labelDesc: UILabel!
    
    @IBOutlet weak var labelStartDate: UILabel!
    
    @IBOutlet weak var labelEndDate: UILabel!
    
    //event
    var event: Event!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Set background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "patrick-tomasso-Y4AZPOnE6ZI-unsplash.jpg")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        //set navigation bar - title and right item button
        self.title = "Event Detail"
        let updateButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(self.onUpdateButtonClicked(_:)))
        self.navigationItem.rightBarButtonItem  = updateButtonItem
        
        //Set displayed labels
        labelEventName.text = self.event.eventName
        labelDesc.text = self.event.desc
        labelStartDate.text = "Start Date: " + convertDateToStringFormat(date: self.event.startDate!, format: "YYYY/MM/dd")
        
        //if event end is true, use end date to calculate the days. otherwise, use today to calculate the
        //if the event end is true, it will show end date
        if(self.event.eventEnd) {
            labelEndDate.text = "End Date: " + convertDateToStringFormat(date: self.event.endDate!, format: "YYYY/MM/dd")
            labelDays.text = String(daysBetween(start: self.event.startDate!, end: self.event.endDate!))
        } else {
            labelEndDate.text = ""
            labelDays.text = String(daysBetween(start: self.event.startDate!, end: Date()))
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: When update button click, redirect to update page
    @objc func onUpdateButtonClicked(_ sender: Any){
        let updateViewController: UpdateViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
        
        updateViewController.event = self.event
        self.navigationController?.pushViewController(updateViewController, animated: false)
    }
    
    //MARK: Utitity func - convert date type to formatted data string
    func convertDateToStringFormat(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    //MARK: Utility func - calculate days between two date
    func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
}
