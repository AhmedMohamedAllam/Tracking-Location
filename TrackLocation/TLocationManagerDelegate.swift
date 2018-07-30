//
//  TLocationManagerDelegate.swift
//  TrackLocation
//
//  Created by LinuxPlus on 7/30/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import Foundation
import CoreLocation


protocol TLocationManagerDelegate {
    func didUpdateLocation(newLocation location: CLLocation?, withError error: Error?)
    func didPauseLocationUpdates()
    func didResumeLocationUpdates()
}

extension TLocationManagerDelegate{
    func didPauseLocationUpdates(){}
    func didResumeLocationUpdates(){}
}
