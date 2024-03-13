//
//  ContentView.swift
//  GodsEyeForiOS
//
//  Created by LiuHongfeng on 13/3/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var cameraController = CameraController()
    
    var body: some View {
        VStack {
            CameraPreview(cameraController: cameraController)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                if cameraController.capturedImage != nil {
                    // 如果已有拍摄的照片，则重新开始取景
                    cameraController.capturedImage = nil
                    cameraController.startSession()
                } else {
                    // 拍照
                    cameraController.takePicture()
                    cameraController.stopSession()
                }
            }) {
                Text(cameraController.capturedImage != nil ? "重新取景" : "拍照")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

