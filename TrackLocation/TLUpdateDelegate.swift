//
//  TLUpdateDelegate.swift
//  TrackLocation
//
//  Created by LinuxPlus on 7/3/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import Foundation
import CoreLocation

protocol TLUpdateDelegate{
    func didUpdateLocation(newLocation location: CLLocation?, withError error: Error?)
    func didPauseLocationUpdates()
    func didResumeLocationUpdates()
}

extension TLUpdateDelegate{
    func didPauseLocationUpdates(){}
    func didResumeLocationUpdates(){}
}
