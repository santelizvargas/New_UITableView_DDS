//
//  DeviceProtocol.swift
//  NewTableView
//
//  Created by Steven Santeliz on 25/10/23.
//

import Foundation

// MARK: - Device Protocol

protocol DeviceProtocol: Hashable {
    var id: UUID { get }
    var title: String { get }
    var imageName: String { get }
}
