//
//  TLAuthDelegate.swift
//  TrackLocation
//
//  Created by LinuxPlus on 7/3/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import Foundation

protocol TLAuthDelegate {
    func didFinishLocationAuth(withError error: TLError?)
}
