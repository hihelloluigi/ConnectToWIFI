//
//  Typealiases.swift
//  ConnectToWifi
//
//  Created by Luigi Aiello on 03/05/2019.
//  Copyright © 2019 Luigi Aiello. All rights reserved.
//

import Foundation

typealias VoidHandler = () -> Void
typealias SuccessHandler = (_ value: Any?) -> Void
typealias FailureHandler = (_ error: NEHotspotError) -> Void
