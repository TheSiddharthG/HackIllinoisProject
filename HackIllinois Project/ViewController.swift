//
//  ViewController.swift
//  HackIllinois Project
//
//  Created by Siddharth Gupta on 9/16/24.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { //will manage UITableView by supplying data and handling user interaction

    @IBOutlet weak var table: UITableView!  // TableView Outlet
    var events: [Event] = []  // Holds the events fetched from the API

    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self  //Sets ViewController as delegate for the UITableView; will handle user interaction with the table
        table.dataSource = self //will provide data to display
    

        // Fetch events from API
        CallingAPI().fetchEvents { [weak self] events in //retrieving events in API
            DispatchQueue.main.async {  //ensures UI is updated on main thread
                self?.events = events ?? [] //fetched events stored in events array
                self?.table.reloadData()
            }
        }
    }

    // MARK: - Table View DataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count  // Number of rows based on the number of events
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //creates/returns cell for each row
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTable", for: indexPath) as! EventTable
        let event = events[indexPath.row]
        cell.eventNameLabel.text = event.name  // Set event name in the label
        //cell.eventNameTextView.text = event.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {  //called when user selects a row in the table. It triggers a segue to another view controller
        performSegue(withIdentifier: "EventDetailsegue", sender: indexPath)
    }
    // Prepare for segue to pass data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //allows to pass data to view controller
        if segue.identifier == "EventDetailsegue" {
            if let indexPath = sender as? IndexPath {  // Sender is the IndexPath from the selected row, passed when the row was selected
                let selectedEvent = events[indexPath.row] //
                let destinationVC = segue.destination as! EventDetailViewController //The event's description  is passed to the eventDescription property of the destination view controller
                destinationVC.eventDescription = selectedEvent.description
                destinationVC.typeOfEvent = selectedEvent.eventType
            }
        }
    }
}



