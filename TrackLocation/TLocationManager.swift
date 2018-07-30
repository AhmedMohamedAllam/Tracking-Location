//
//  TLocationManager.swift
//  TrackLocation
//
//  Created by LinuxPlus on 7/30/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import Foundation
import CoreLocation

class TLocationManager{
    fileprivate var locationAuth: TLAuth!
    fileprivate var locationUpdate: TLUpdate!
    var delegate: TLocationManagerDelegate?
    
    init(withConfiguration config: TLConfig = TLConfig()) {
        self.locationAuth = TLAuth()
        self.locationUpdate = TLUpdate(withConfiguration: config)
        
        locationAuth.delegate = self
        locationUpdate.delegate = self
    }
    
    func startUpdateLocation(){
        locationAuth.requestAuthorization()
    }
    
    func stopUpdateLocation(){
        locationUpdate.stopTrackingUpdates()
    }
    
    
}

extension TLocationManager: TLAuthDelegate{
    func didFinishLocationAuth(withError error: TLError?){
        guard error == nil else{
            delegate?.didUpdateLocation(newLocation: nil, withError: error)
            return
        }
        
    locationUpdate.startTrackingUpdates()
        
    }
}

extension TLocationManager: TLUpdateDelegate{
    func didUpdateLocation(newLocation location: CLLocation?, withError error: Error?){
        delegate?.didUpdateLocation(newLocation: location, withError: error)
    }
    
    func didResumeLocationUpdates() {
        delegate?.didResumeLocationUpdates()
    }
    func didPauseLocationUpdates() {
        delegate?.didPauseLocationUpdates()
    }
}
