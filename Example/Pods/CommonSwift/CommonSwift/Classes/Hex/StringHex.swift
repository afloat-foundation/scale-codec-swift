import Foundation

public class StringHex {
    private let string: String
    
    public init(string: String) {
        self.string = string
    }
    
    public func decode() -> Data? {
        let hexStr = string.dropFirst(string.hasPrefix("0x") ? 2 : 0)
        
        guard hexStr.count % 2 == 0 else {
            return nil
        }
        
        var newData = Data(capacity: hexStr.count/2)
        
        var indexIsEven = true
        for i in hexStr.indices {
            if indexIsEven {
                let byteRange = i...hexStr.index(after: i)
                guard let byte = UInt8(hexStr[byteRange], radix: 16) else { return nil }
                newData.append(byte)
            }
            indexIsEven.toggle()
        }
        return newData
    }
}

public extension String {
    var hex: StringHex {
        .init(string: self)
    }
}
