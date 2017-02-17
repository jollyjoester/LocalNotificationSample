//
//  ViewController.swift
//  LocalNotificationSample
//
//  Created by NanashimaHideyuki on 2/18/17.
//  Copyright © 2017 jollyjoester. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        
        notify(timeInterval: 5, repeats: false)
        notify(timeIntervalSinceNow: 10, repeats: false)
        
        let coordinate = CLLocationCoordinate2D(latitude: 34.041714, longitude: 131.569034)
        notify(center: coordinate, radius: 100)
    }
    
    func notify(timeInterval: TimeInterval, repeats: Bool) {
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "time interval"
        //content.launchImageName
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: timeInterval, repeats: repeats)
        
        let request = UNNotificationRequest.init(identifier: "FiveSecondNotification", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
    
    func notify(timeIntervalSinceNow: TimeInterval, repeats: Bool) {
        
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "calendar"
        //content.launchImageName
        content.sound = UNNotificationSound.default()

        let date = Date(timeIntervalSinceNow: timeIntervalSinceNow)
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate,
                                                    repeats: repeats)
        let request = UNNotificationRequest.init(identifier: "CalendaarNotification", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
    
    func notify(center: CLLocationCoordinate2D, radius: CLLocationDistance) {
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "鞠生幼稚園だよ"
        //content.launchImageName
        content.sound = UNNotificationSound.default()
        
        let region = CLCircularRegion(center: center, radius: radius, identifier: "localNotificationSample")
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        let request = UNNotificationRequest.init(identifier: "CalendaarNotification", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
    
}

