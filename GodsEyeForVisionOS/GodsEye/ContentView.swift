//
//  ContentView.swift
//  GodsEye
//
//  Created by LiuHongfeng on 9/3/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, God's Eye can translate all the text you see in real time, and identify object types and animal species...")

        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
