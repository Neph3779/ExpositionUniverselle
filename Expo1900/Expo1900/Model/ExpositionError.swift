//
//  Error.swift
//  Expo1900
//
//  Created by μ²μν on 2021/04/06.
//

import Foundation

enum ExpositionError: Error, CustomDebugStringConvertible {
    case jsonFormatFailed(fileName: String)
    case wrongJsonFileName(fileName: String)
    case wrongImageName(fileName: String)
    
    var debugDescription: String {
        switch self {
        case .jsonFormatFailed(fileName: let fileName):
            return "π’ \(fileName).jsonνμΌμ λμ½λ© κ³Όμ μμ μ€λ₯κ° λ°μνμ΄μ"
        case .wrongJsonFileName(fileName: let fileName):
            return "π’ \(fileName).jsonμ μ°Ύμ μ μμ΄μ"
        case .wrongImageName(fileName: let fileName):
            return "π’ μ΄λ―Έμ§ νμΌ : \(fileName)λ₯Ό μ°Ύμ μ μμ΄μ"
        }
    }
}
