//
//  OrientOnPathApp.swift
//  OrientOnPath WatchKit Extension
//
//  Created by Amos Gyamfi on 21.1.2021.
//

import SwiftUI

@main
struct OrientOnPathApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
