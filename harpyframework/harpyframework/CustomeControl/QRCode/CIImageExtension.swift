//
//  CIImageExtension.swift
//  QRCode
//
//  Created by Jaiouch Yaman - Société ID-APPS on 18/12/2015.
//  Copyright © 2015 Alexander Schuch. All rights reserved.
//

import Foundation

internal typealias Scale = (dx: CGFloat, dy: CGFloat)

internal extension CIImage {
    
    /// Creates an `UIImage` with interpolation disabled and scaled given a scale property
    ///
    /// - parameter withScale:  a given scale using to resize the result image
    ///
    /// - returns: an non-interpolated UIImage
    internal func nonInterpolatedImage(withScale scale: Scale = Scale(dx: 1, dy: 1)) -> UIImage? {
        //++ BUG0172-SPJ (NguyenPT 20171130) Fix bug generate QR code on iPhone 5 was failed
//        guard let cgImage = CIContext(options: nil).createCGImage(self, from: self.extent) else { return nil }
        let eaglContext = EAGLContext(api: .openGLES2)
        let ciContext = CIContext(eaglContext: eaglContext!)
        guard let cgImage = ciContext.createCGImage(
            self, from: self.extent)
            else {
                return nil
        }
        //-- BUG0172-SPJ (NguyenPT 20171130) Fix bug generate QR code on iPhone 5 was failed
        let size = CGSize(width: self.extent.size.width * scale.dx, height: self.extent.size.height * scale.dy)
        
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.interpolationQuality = .none
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.draw(cgImage, in: context.boundingBoxOfClipPath)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
    }
}
