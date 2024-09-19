//
//  API.swift
//  HackIllinois Project
//
//  Created by Siddharth Gupta on 9/16/24.
//
// Had some assistance using other templates/ChatGPT

import Foundation //provides necessary components for network requests

class CallingAPI {
    func fetchEvents(completion: @escaping ([Event]?) -> Void) { //fetches event data from specified URL. Takes a completion handler as an argument that will be called once data fetching is complete
        if let url = URL(string: "https://adonix.hackillinois.org/event/") { //attempts to create url
            URLSession.shared.dataTask(with: url) { data, response, error in //creates data task that performs an HTTP GET request to specified URL
                // Check for errors and decode JSON
                if let data = data, error == nil { //ensures data was recieved
                    do {
                        let eventArray = try JSONDecoder().decode(EventArray.self, from: data) //decodes JSON data into Event Array object
                        completion(eventArray.events)  //extracts events property and calls completion handler
                    } catch {
                        print("Failed to decode JSON: \(error)")
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }.resume() //starts network request
        } else {
            completion(nil) //invalid URL
        }
    }
}
