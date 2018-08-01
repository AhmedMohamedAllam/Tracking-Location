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
    private var authType: TLAuthType
    let locationManager = CLLocationManager()

    
    init(configuration config: TLConfig) {
        authType = config.authType
        super.init()
        locationManager.delegate = self
    }
       func requestAuthorization() {
        
        if isLocationServiceAuthorized(){
            delegate?.didFinishLocationAuth(withError: nil)
        }else{
            switch authType {
            case .always:
                locationManager.requestAlwaysAuthorization()
            case .whenInUse:
                locationManager.requestWhenInUseAuthorization()
            }
        }
    }

    
   
    
    private func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }
    
    private func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
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
            delegate?.didFinishLocationAuth(withError: nil)
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
