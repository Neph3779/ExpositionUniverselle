//
//  DefaultValues.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/12.
//

import Foundation
import UIKit

enum ExpoAffix {
    enum Prefix {
        static let visitors = "방문객 : "
        static let location = "개최지 : "
        static let duration = "개최기간 : "
    }

    enum Suffix {
        static let visitors = " 명"
    }
}

enum ViewConstant {
    static let scrollBarWidth: CGFloat = 10
    static let maximumImageViewHeight: CGFloat = 500
}

enum CellConstant {
    static let imageViewWidth: CGFloat = 100
    static let imageViewMaximumHeight: CGFloat = 60
    static let contentViewMargin: CGFloat = 20
}
