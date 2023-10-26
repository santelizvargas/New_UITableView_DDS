//
//  Device.swift
//  NewTableView
//
//  Created by Steven Santeliz on 25/10/23.
//

import Foundation

struct Device: DeviceProtocol {
    var id: UUID = UUID()
    var title: String
    var imageName: String
}
