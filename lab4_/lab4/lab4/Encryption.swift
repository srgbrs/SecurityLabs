import Foundation
import CommonCrypto

func md5Encryption(str: String) -> String {
    let data = Data(str.utf8)
    let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
        var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
        return hash
    }
    return hash.map { String(format: "%02x", $0) }.joined()
}

func sha1Encryption(str: String) -> String{
    let data = Data(str.utf8)
    var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
    data.withUnsafeBytes {
        _ = CC_SHA1($0.baseAddress, CC_LONG(data.count), &digest)
    }
    return digest.map { String(format: "%02hhx", $0) }.joined()
}
