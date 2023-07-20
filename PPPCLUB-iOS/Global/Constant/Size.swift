//
//  Size.swift
//  PPPCLUB-iOS
//
//  Created by 류희재 on 2023/07/10.
//

import UIKit

struct Size {
    // MARK: 디바이스 width
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // MARK: 디바이스 height
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static var qrFocusZone: CGRect {
        return CGRect(x: (Size.width - 200) / 2 , y: (Size.height - 200) / 2, width: 200, height: 200)
    }
    
    static var tabBarHeight: CGFloat {
        return 116.adjusted
    }
}
