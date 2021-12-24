//
//  AppleWatchBreathApp.swift
//  AppleWatchBreath WatchKit Extension
//
//  Created by Amos Gyamfi on 20.1.2021.
//

import SwiftUI

@main
struct AppleWatchBreathApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
