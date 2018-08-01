//
//  TLUpdate.swift
//  TrackLocation
//
//  Created by LinuxPlus on 7/3/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import Foundation
import CoreLocation

class TLUpdate:NSObject, TLUpdateProtocol {
    
    var delegate: TLUpdateDelegate?
    fileprivate let locationManager = CLLocationManager()
    private var distanceFilter: CLLocationDistance!
    private var disiredAccuracy: CLLocationAccuracy!
    
    
    
    init(withConfiguration config: TLConfig) {
        super.init()
        self.distanceFilter = config.locationDistance
        self.disiredAccuracy = config.desiredAccuracy
        locationManager.pausesLocationUpdatesAutomatically = config.pausesLocationUpdatesAutomatically
        locationManager.delegate = self
    }
    
    override init() {
        super.init()
    }
    
    func startTrackingUpdates() {
        locationManager.startUpdatingLocation()
    }
    
    
    func stopTrackingUpdates() {
        locationManager.stopUpdatingLocation()
    }
}

extension TLUpdate: CLLocationManagerDelegate{

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.didUpdateLocation(newLocation: locations.first, withError: nil)
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        delegate?.didPauseLocationUpdates()
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        delegate?.didResumeLocationUpdates()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        delegate?.didUpdateLocation(newLocation: nil, withError: error)
    }
}
