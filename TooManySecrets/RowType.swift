import UIKit

enum RowType {
    case readable(String)
    case obscure(String)
}

extension RowType {
    var string: String {
        switch self {
        case .readable(let word):
            return "\(word)"
        case .obscure(let number):
            return "\(number)"
        }
    }
    
    var image: UIImage {
        if case RowType.readable = self {
            return #imageLiteral(resourceName: "spy")
        }
        
        return #imageLiteral(resourceName: "spy2")
    }

}

class Helper {
    static func rowType(for word: String, isObscure: Bool = false) -> RowType {
        Thread.sleep(forTimeInterval: 0.1)  //exagerate the threading problem - slow things down so we can see the problem easier
        return isObscure ? .obscure(word) : .readable(word)
    }
}
