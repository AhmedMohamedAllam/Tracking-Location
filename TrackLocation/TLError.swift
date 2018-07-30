//
//  TLError.swift
//  TrackLocation
//
//  Created by LinuxPlus on 7/3/18.
//  Copyright © 2018 Allam. All rights reserved.
//

import Foundation

struct TLError: Error {
    var localizedDescription: String
    
    init(with message: String) {
        localizedDescription = message
    }
    
}
