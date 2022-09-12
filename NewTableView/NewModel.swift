//
//  NewModel.swift
//  NewTableView
//
//  Created by User-G04 on 9/9/22.
//

import Foundation

protocol DeviceProtocol: Hashable {
    var id: UUID { get }
    var title: String { get }
    var imageName: String { get }
}

struct Device: DeviceProtocol {
    var id: UUID = UUID()
    
    var title: String
    
    var imageName: String
}

let device = [
Device(title: "Laptop", imageName: "laptopcomputer"),
Device(title: "Mac Mini", imageName: "macmini"),
Device(title: "Mac Pro", imageName: "macpro.gen3"),
Device(title: "Displays", imageName: "display.2"),
Device(title: "TV", imageName: "appletv"),
]

let device2 = [
Device(title: "Laptop", imageName: "laptopcomputer"),
Device(title: "Mac Mini", imageName: "macmini"),
Device(title: "Mac Pro", imageName: "macpro.gen3")
]

