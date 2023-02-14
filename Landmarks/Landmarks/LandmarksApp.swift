//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Van Hong Xuan on 09/02/2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
