//
//  GodsEyeApp.swift
//  GodsEye
//
//  Created by LiuHongfeng on 9/3/24.
//

import SwiftUI

@main
struct GodsEyeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
