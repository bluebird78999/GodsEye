//
//  CameraController.swift
//  GodsEyeForiOS
//
//  Created by LiuHongfeng on 13/3/24.
//

import AVFoundation
import UIKit

class CameraController: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    private var captureSession: AVCaptureSession?
    private var photoOutput: AVCapturePhotoOutput?
    private var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    @Published var capturedImage: UIImage?
    
    override init() {
        super.init()
        initializeCamera()
    }
    
    private func initializeCamera() {
        self.captureSession = AVCaptureSession()
        
        guard let captureSession = self.captureSession else { return }
        
        // 设置为照片模式
        captureSession.sessionPreset = .photo
        
        // 尝试添加后置摄像头为视频输入设备
        guard let backCamera = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: backCamera) else { return }
        
        if captureSession.canAddInput(input) {
            captureSession.addInput(input)
        }
        
        // 添加照片输出
        self.photoOutput = AVCapturePhotoOutput()
        if captureSession.canAddOutput(self.photoOutput!) {
            captureSession.addOutput(self.photoOutput!)
        }
        
        captureSession.startRunning()
    }
    
    func takePicture() {
        let settings = AVCapturePhotoSettings()
        self.photoOutput?.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            self.capturedImage = UIImage(data: imageData)
        }
    }
    
    func startSession() {
        if let session = self.captureSession, !session.isRunning {
            session.startRunning()
        }
    }
    
    func stopSession() {
        if let session = self.captureSession, session.isRunning {
            session.stopRunning()
        }
    }
}
