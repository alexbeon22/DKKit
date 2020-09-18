//
//  DKImageView.swift
//  DKKit
//
//  Created by Dineshkumar Kandasamy on 17/03/20.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import Foundation
import UIKit
import AVKit

public func DKResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    var newSize: CGSize
    if widthRatio > heightRatio {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
    }
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
}

public func DKImageView() -> UIImageView {

    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView

}

public func DKImageViewWithImage(_ name: String) -> UIImageView {

    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: name)
    return imageView

}

public func createThumbnailOfVideoFromRemoteUrl(url: URL, completion: @escaping ((_ image: UIImage?) -> Void)) {
    DispatchQueue.global().async {
        let asset = AVAsset(url: url)
        let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
        avAssetImageGenerator.appliesPreferredTrackTransform = true
        let thumnailTime = CMTimeMake(value: 2, timescale: 1)
        do {
            let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil)
            let thumbNailImage = UIImage(cgImage: cgThumbImage)
            DispatchQueue.main.async {
                completion(thumbNailImage)
            }
        } catch {
            print(error.localizedDescription)
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
}

extension UIImage {
    func tint(with color: UIColor) -> UIImage {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()

        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
