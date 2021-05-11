//
//  File.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation
import UIKit
extension UIApplication {
    func getStatusBarYOffset() -> CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }

    func doesDeviceHasTopNotch() -> Bool {
        if #available(iOS 11.0, *), UIApplication.shared.statusBarFrame.height > 20 {
            return true
        }
        return false
    }

    func doesDeviceHasBottomBar() -> Bool {
        if #available(iOS 11.0, *), let keyWindow = UIApplication.shared.keyWindow, keyWindow.safeAreaInsets.bottom > 0 {
            return true
        }
        return false
    }
}
