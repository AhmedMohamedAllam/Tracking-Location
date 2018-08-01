//
//  ViewController.swift
//  TrackLocation
//
//  Created by LinuxPlus on 5/18/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, TLocationManagerDelegate {

    var locationManager: TLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = TLocationManager()
        locationManager.delegate = self
        locationManager.startUpdateLocation()
        
    }

    
    func didUpdateLocation(newLocation location: CLLocation?, withError error: Error?) {
        guard error == nil else {
            print(error!)
            return
        }
        
        if let location = location{
            print(location.coordinate)
        }
        
    }

}

