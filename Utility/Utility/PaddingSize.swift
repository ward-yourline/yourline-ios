import Foundation
import UIKit

// MARK: - Typical Height Types

public enum PaddingSize: String, Decodable {
    
    case none
    case pt_2 = "extra_small"
    case pt_4
    case pt_8
    case pt_16
    case pt_32 = "extra_large"
    case pt_64
    case pt_128
    
    public func convertToCGFloat() -> CGFloat {
        switch self {
        case .none: return 0.0
        case .pt_2: return 2.0
        case .pt_4: return 4.0
        case .pt_8: return 8.0
        case .pt_16: return 16.0
        case .pt_32: return 32.0
        case .pt_64: return 64.0
        case .pt_128: return 128.0
        }
    }
}
