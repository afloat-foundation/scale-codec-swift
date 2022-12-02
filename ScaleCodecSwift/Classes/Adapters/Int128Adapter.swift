import Foundation
import CommonSwift

class Int128Adapter: ScaleCodecAdapter<Int128> {
    override func read(_ type: Int128.Type, from reader: DataReader) throws -> Int128 {
        try Data(reader.read(size: Int128.size)).int128()
    }
    
    override func write(value: Int128) throws -> Data {
        value.data()
    }
}
