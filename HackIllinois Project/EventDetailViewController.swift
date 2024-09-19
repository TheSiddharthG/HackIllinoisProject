//
//  EventDetailViewController.swift
//  HackIllinois Project
//
//  Created by Siddharth Gupta on 9/16/24.
//

import UIKit

class EventDetailViewController: UIViewController { //inherits all properties
    @IBOutlet weak var descriptionLabel: UILabel! //weak keyword prevents memory leaks and ! indicates that it's expected to be non-nil
    @IBOutlet weak var eventTypeLabel: UILabel!

    var eventDescription: String? //optional string, will be used to store the description of the event
    var typeOfEvent: String?
    
    override func viewDidLoad() { //Called after the view controller's view has been loaded into memory to perform additional setup
        super.viewDidLoad() //ensures any setup done by parent class is performed

        // Set the event description
        descriptionLabel.text = eventDescription //displayes event description on to screen
        eventTypeLabel.text = typeOfEvent
    }
}
