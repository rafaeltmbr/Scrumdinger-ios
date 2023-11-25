import SwiftUI

enum Theme: String {
    case buttercup
    case indigo
    case magenta
    case navy
    case orange
    case purple
    case sky
    case yellow
    
    var accentColor: Color {
        switch self {
            case .buttercup, .orange, .sky, .yellow: return .black
            default: return .white
        }
    }

    var mainColor: Color {
        switch self {
        case .buttercup: return .mint
        case .indigo: return .indigo
        case .magenta: return .pink
        case .navy: return .cyan
        case .orange: return .orange
        case .purple: return .purple
        case .sky: return .cyan
        case .yellow: return .yellow
        }
    }
    
    var name: String {
        rawValue.capitalized
    }
}

