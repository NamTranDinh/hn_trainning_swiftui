//
//  ScannerVCDelegate.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 12/2/25.
//

import UIKit
import AVFoundation

enum CameraError: String {
    case unableToInitialize = "Unable to initialize the camera"
    case invalidScanValue   = "Something is wrong with the camera. We can't scan this code"
    case invalidDeviceInput = "The value scanned is not a valid barcode. This app only supports EAN-8 and EAN-13"
}

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String) // Called when a barcode is successfully scanned.
    func didFail(with error: CameraError) // Called when an error occurs during scanning.
}


final class ScannerVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    let captureSession = AVCaptureSession() // Manages the flow of data from input to output.
    var previewLayer: AVCaptureVideoPreviewLayer? // Layer to display the camera preview.
    weak var scannerDelegate: ScannerVCDelegate? // Delegate to notify about scanning results or errors.
    
    // Initializer that accepts an optional delegate.
    init(scannerDelegate: ScannerVCDelegate? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    // Required initializer for using the class with Storyboards. Calls delegate on failure.
    required init?(coder: NSCoder) {
        scannerDelegate?.didFail(with: .unableToInitialize) // Notify delegate if initialization fails.
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let previewLayer = previewLayer else {
            scannerDelegate?.didFail(with: .invalidDeviceInput)
            return
        }
        previewLayer.frame = view.bounds
    }
    
    // Sets up the capture session, initializes the camera input, and prepares for scanning.
    private func setupCaptureSession() {
        guard let backCameraDevice = AVCaptureDevice.default(for: .video) else {
            scannerDelegate?.didFail(with: .invalidDeviceInput) // Notify if unable to access camera.
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        do {
            try videoInput = AVCaptureDeviceInput(device: backCameraDevice)
            if(captureSession.canAddInput(videoInput)){
                captureSession.addInput(videoInput) // Add video input to the session.
            } else {
                scannerDelegate?.didFail(with: .invalidDeviceInput) // Notify if input cannot be added.
                return
            }
            
        } catch {
            print("Failed to create AVCaptureDeviceInput \(error)") // Handle error in input creation.
        }
        
        let metadataOutput = AVCaptureMetadataOutput() // Create metadata output for scanning.
        if(captureSession.canAddOutput(metadataOutput)){
            captureSession.addOutput(metadataOutput) // Add metadata output to the session.
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: .main) // Set delegate for metadata output.
            metadataOutput.metadataObjectTypes = [.qr, .ean8, .ean13] // Specify barcode types to scan.
        } else {
            scannerDelegate?.didFail(with: .invalidDeviceInput) // Notify if output cannot be added.
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession) // Create a preview layer.
        previewLayer?.videoGravity = .resizeAspectFill // Set the content mode of the preview layer.
        previewLayer?.frame = view.layer.bounds // Set the frame to match the view's bounds.
        view.layer.addSublayer(previewLayer!) // Add the preview layer to the view's layer.
        
        captureSession.startRunning() // Start the capture session to begin scanning.
    }
    
    // Delegate method that is called when metadata objects are output from the capture session.
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate?.didFail(with: .invalidScanValue) // Notify if no valid metadata object is found.
            return
        }
        
        guard let barcodeStringValue = metadataObject.stringValue else {
            scannerDelegate?.didFail(with: .invalidScanValue) // Notify if the scanned value is invalid.
            return
        }
        
        captureSession.stopRunning()
        scannerDelegate?.didFind(barcode: barcodeStringValue) // Notify delegate with the scanned barcode.
        
        print("Scanned barcode: \(barcodeStringValue)") // Print the scanned barcode to the console.
    }
    
}
