//
//  TLConfig.swift
//  TrackLocation
//
//  Created by LinuxPlus on 7/30/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import Foundation
import CoreLocation

struct TLConfig {
    var locationDistance: CLLocationDistance = kCLDistanceFilterNone // default distance
    var desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyBest // default accuracy
}
