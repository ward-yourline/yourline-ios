import Foundation
import UIKit

// MARK: - Typical Height Types

public enum PaddingSize: String, Decodable {
    
    case none
    case extraSmall = "extra_small"
    case small
    case medium
    case large
    case extraLarge = "extra_large"
    case largest
    
    func convertToCGFloat() -> CGFloat {
        switch self {
        case .none: return 0.0
        case .extraSmall: return 2.0
        case .small: return 4.0
        case .medium: return 8.0
        case .large: return 16.0
        case .extraLarge: return 32.0
        case .largest: return 64.0
        }
    }
}
