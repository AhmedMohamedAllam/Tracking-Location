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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didUpdateLocation(newLocation location: CLLocation?, withError error: Error?) {
        guard error == nil else {
            print(error!.localizedDescription)
            return
        }
        
        if let location = location{
            print(location.coordinate)
        }
        
    }

}

