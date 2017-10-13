//
//  ScannerVC.swift
//  harpyframework
//
//  Created by SPJ on 8/30/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit
import AVFoundation

public class ScannerVC: ChildExtViewController {
    // MARK: Properties
    /** Value label */
    @IBOutlet var messageLabel:     UILabel!
    /** Session capture */
    var captureSession:             AVCaptureSession?
    /** Preview layer */
    var videoPreviewLayer:          AVCaptureVideoPreviewLayer?
    /** QR code frame view */
    var qrCodeFrameView:            UIView?
    
    // MARK: Static variable
    /** Notification name */
    public static var _notificationName:    String = DomainConst.BLANK
    
    // MARK: Constant
    
    // MARK: Override methods
    /**
     * Called after the controller's view is loaded into memory.
     */
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.createNavigationBar(title: "Quét mã QR")
        // Do any additional setup after loading the view.
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter.
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = CGRect(x: 0, y: self.getTopHeight(),
                                              width: UIScreen.main.bounds.width,
                                              height: UIScreen.main.bounds.height - self.getTopHeight())
            view.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture.
            captureSession?.startRunning()
            
            // Move the message label and top bar to the front
            view.bringSubview(toFront: messageLabel)
            
            // Initialize QR Code Frame to highlight the QR code
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                view.addSubview(qrCodeFrameView)
                view.bringSubview(toFront: qrCodeFrameView)
            }
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        self.view.makeComponentsColor()
    }
    
    /**
     * Handle update constants
     */
    override public func updateConst() {
        super.updateConst()
    }
    
    /**
     * Create children views
     */
    override public func createChildrenViews() {
        super.createChildrenViews()
        // Get current device type
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:        // iPhone
            break
        case .pad:          // iPad
            switch UIApplication.shared.statusBarOrientation {
            case .portrait, .portraitUpsideDown:        // Portrait
                break
            case .landscapeLeft, .landscapeRight:       // Landscape
                break
            default:
                break
            }
            
            break
        default:
            break
        }
    }
    
    /**
     * Update children views
     */
    override public func updateChildrenViews() {
        super.updateChildrenViews()
        updateLayout()
        // Get current device type
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:        // iPhone
            break
        case .pad:          // iPad
            switch UIApplication.shared.statusBarOrientation {
            case .portrait, .portraitUpsideDown:        // Portrait
                break
            case .landscapeLeft, .landscapeRight:       // Landscape
                break
            default:
                break
            }
            
            break
        default:
            break
        }
    }
    
    // MARK: Event handler
    /**
     * Finish scan QR code
     */
    internal func finishScanQR(value: String) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: ScannerVC._notificationName),
                object: value)
            // Remove observer
            NotificationCenter.default.removeObserver(
                self.view,
                name: Notification.Name(
                    rawValue: ScannerVC._notificationName),
                object: nil)
        }
    }
    
    // MARK - Layout
    private func updateLayout() {
        videoPreviewLayer?.frame = CGRect(x: 0, y: self.getTopHeight(),
                                          width: UIScreen.main.bounds.width,
                                          height: UIScreen.main.bounds.height - self.getTopHeight())
    }
}

// MARK: Protocol - AVCaptureMetadataOutputObjectsDelegate
extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    /**
     * Informs the delegate that the capture output object emitted new metadata objects.
     */
    public func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            //            qrCodeFrameView?.frame = barCodeObject!.bounds
            qrCodeFrameView?.frame = CGRect(
                x: barCodeObject!.bounds.minX,
                y: barCodeObject!.bounds.minY + getTopHeight(),
                width: barCodeObject!.bounds.width,
                height: barCodeObject!.bounds.height)
            
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
                //                showAlert(message: "Quét mã thành công:\n\(metadataObj.stringValue)",
                //                    okTitle: DomainConst.CONTENT00008,
                //                    cancelTitle: "Quét lại",
                //                    okHandler: {
                //                        alert in
                //                },
                //                    cancelHandler: {
                //                        alert in
                //                })
                self.finishScanQR(value: metadataObj.stringValue)
                _ = self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
