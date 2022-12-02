import Foundation
import CommonSwift

class UInt128Adapter: ScaleCodecAdapter<UInt128> {
    override func read(_ type: UInt128.Type, from reader: DataReader) throws -> UInt128 {
        try Data(reader.read(size: UInt128.size)).uInt128()
    }
    
    override func write(value: UInt128) throws -> Data {
        value.data()
    }
}
