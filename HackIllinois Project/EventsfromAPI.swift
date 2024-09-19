//
//  Event.swift
//  HackIllinois Project
//
//  Created by Siddharth Gupta on 9/16/24.
//

import Foundation

struct Event: Decodable { //Decodable ensures instances of Event can be automatically created by decoding JSON data that matches name/description
    let name: String
    let description: String
    let startTime: Int
    let endTime: Int
    let eventType: String
}

struct EventArray: Decodable { //Array of Event objects
    let events: [Event]
}
