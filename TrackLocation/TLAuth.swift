//
//  TLAuth.swift
//  TrackLocation
//
//  Created by LinuxPlus on 5/18/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import Foundation
import CoreLocation

class TLAuth:NSObject, TLAuthProtocol{
    var delegate: TLAuthDelegate?
    fileprivate var authError: TLError?
    
    func requestAuthorization(authType type: TLAuthType = .whenInUse) {
        
        guard isLocationServiceAvalible()else{
            authError = TLError(with: "error: location service is not Avalible.")
            delegate?.didFinishLocationAuth(withError: authError)
            return
        }
        
        guard isLocationServiceEnabled()else{
            authError = TLError(with: "error: location service is not enabled.")
            delegate?.didFinishLocationAuth(withError: authError)
            return
        }
        
        switch type {
        case .always:
            locationManager.requestAlwaysAuthorization()
        case .whenInUse:
            locationManager.requestWhenInUseAuthorization()
        }
    }

    
   
    let locationManager = CLLocationManager()
    
    private func requestAlwaysAuthorization() {
        guard isLocationServiceAvalible() && isLocationServiceEnabled()else{
            locationManager.requestAlwaysAuthorization()
            return
        }
    }
    
    private func requestWhenInUseAuthorization() {
        guard isLocationServiceAvalible() && isLocationServiceEnabled() else{
            locationManager.requestWhenInUseAuthorization()
            return
        }
    }
    
    func isLocationServiceEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    func isLocationServiceAuthorized() -> Bool {
        let authStatus = CLLocationManager.authorizationStatus()
        return (authStatus == .authorizedAlways || authStatus == .authorizedWhenInUse)
    }
    
    private func isLocationServiceAvalible() -> Bool{
        return (isLocationServiceEnabled() && isLocationServiceAuthorized())
    }
    
}

extension TLAuth: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            delegate?.didFinishLocationAuth(withError: authError)
        case .denied:
            authError = TLError(with: "Location Service access (denied)")
            delegate?.didFinishLocationAuth(withError: authError)
        case .notDetermined:
            authError = TLError(with: "Location Service access (notDetermined)")
            delegate?.didFinishLocationAuth(withError: authError)
        case .restricted:
            authError = TLError(with: "Location Service access (restricted)")
            delegate?.didFinishLocationAuth(withError: authError)
        }
    }
}
