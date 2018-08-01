//
//  TLAuthProtocol.swift
//  TrackLocation
//
//  Created by LinuxPlus on 5/18/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import Foundation
protocol TLAuthProtocol{
    var  delegate: TLAuthDelegate? {set get}
    func requestAuthorization()
    func isLocationServiceEnabled() -> Bool
    func isLocationServiceAuthorized() -> Bool
}

