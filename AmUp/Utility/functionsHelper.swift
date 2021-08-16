//
//  functionsHelper.swift
//  instaFaraz
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 4/26/21.
//

import Foundation
import UIKit


extension UIViewController {
    
    
    //Set image in righte of navigation bar
    func showimageForNavBar(image : UIImageView) {
        let image2: UIImage = image.image!

        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 110, height: 40))
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 40))
        imageview.image = image2
        
        imageview.contentMode = UIView.ContentMode.scaleAspectFill
        containView.addSubview(imageview)
        
        
        let rightBarButton = UIBarButtonItem(customView: containView)
        self.navigationItem.leftBarButtonItem = rightBarButton
        
    }
    
    
    func urlImageGoogleMap(_ lat : String , _ long: String) -> String {
       let url = "https://maps.googleapis.com/maps/api/staticmap?center=35.6970118,51.2097347&markers=color:red|\(lat),\(long)&zoom=12&size=600x600&key=AIzaSyCBj5ZEuZKxI14hqMDxxaxgE666ry1JxWk"
        
        
        return url
    }
 
    func lblNavBar(_ stringLabel: String){
    
        let label = UILabel()
        label.textColor = UIColor(named: "lableCustom")
        label.font = UIFont(name: "FONTSPRINGDEMO-BlueVinylRegular", size: 30)
        label.text = stringLabel
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)

    }
    
    
    func setFontNavbar() {
        UIBarButtonItem.appearance().setTitleTextAttributes(
        [
            NSAttributedString.Key.font : UIFont(name: "Rockwell", size: 4)!,
            NSAttributedString.Key.foregroundColor : UIColor.white,
        ], for: .normal )

        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "FONTSPRINGDEMO-BlueVinylRegular", size: 7)!], for: .normal)

    }
    
}


extension UIImage {

    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!

        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!

        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)

        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }

}


extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}


struct Screen {

 static var width: CGFloat {
  return UIScreen.main.bounds.width
 }

 static var height: CGFloat {
  return UIScreen.main.bounds.height
 }

 static var statusBarHeight: CGFloat {
  let viewController = UIApplication.shared.windows.first!.rootViewController
  return viewController!.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
 }

}
