//
//  CameraPreview.swift
//  GodsEyeForiOS
//
//  Created by LiuHongfeng on 13/3/24.
//

import CameraController
import SwiftUI

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var cameraController: CameraController
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        // 设置和更新预览层
        let previewLayer = AVCaptureVideoPreviewLayer(session: cameraController.captureSession!)
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        DispatchQueue.main.async {
            previewLayer.frame = view.bounds
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let capturedImage = cameraController.capturedImage {
            // 如果有拍摄的照片，则显示照片
            uiView.layer.sublayers?.removeAll()
            uiView.layer.contents = capturedImage.cgImage
        } else {
            // 否则，显示相机预览
            let previewLayer = AVCaptureVideoPreviewLayer(session: cameraController.captureSession!)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.frame = uiView.bounds
            uiView.layer.addSublayer(previewLayer)
        }
    }
}
