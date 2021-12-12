import Foundation

extension StringProtocol {
    var asciiValues: [UInt8] { compactMap(\.asciiValue) }
}

extension String {
    var base64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .ascii)
    }

    var base64Encoded: String? {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
}


func convertHexToAscii(hex: String) -> String {
    var result: String = ""
    
    let zero: UInt8 = UInt8(Unicode.Scalar("0").value) // 48
    let aLettter: UInt8 = UInt8(Unicode.Scalar("a").value) // 97
    
    for element in stride(from: 0, to: hex.count, by: 2) {
        var index = hex.index(hex.startIndex, offsetBy: element)
        let c = Character(extendedGraphemeClusterLiteral: hex[index])

        var b : String = String(hex[index])
        var unic = Unicode.Scalar(b)!.value

        var uIntValue_try3: UInt8 = UInt8(unic)
        
        var r1: Int
        var r2: Int
        
        if hex[index].isNumber {
             r1 = Int(uIntValue_try3 - zero)
        } else {
            r1 = Int(uIntValue_try3 - aLettter + 10)
        }
        
        // r1 - первый регистр
         index = hex.index(hex.startIndex, offsetBy: element+1)
         b = String(hex[index])
         unic = Unicode.Scalar(b)!.value
         uIntValue_try3 = UInt8(unic)
        
        
        if hex[index].isNumber {
             r2 = Int(uIntValue_try3 - zero)
        } else {
            r2 = Int(uIntValue_try3 - aLettter + 10)
        }
    
        let rez = r1 * 16 + r2
       
        result += String(UnicodeScalar(rez)!)
        
    }
    
    return result
}

func getIntArrayFromString(str: String) -> [UInt8]? {
    var array: [UInt8]? = []
    array =  str.compactMap(\.asciiValue)
    return array
}

 func result(asciiStringArray: [[UInt8]], key: String) {

    for i in 0..<asciiStringArray.count {
        for j in 0..<asciiStringArray.count {
            print("xor \(i) - \(j)")
            let cipher = xor(first: asciiStringArray[i], second: asciiStringArray[j])
            // print(cipher)
            
            guard let keyInts = getIntArrayFromString(str: key) else { return }
            let cipherWithWord = xor(first: cipher, second: keyInts)
            print(cipherWithWord)

            print(String(bytes: cipherWithWord, encoding: .ascii)!)
            print("")
        }
    }
    
}


func xor(first: [UInt8], second: [UInt8]) -> [UInt8] {

   let firstLength = first.count
   let secondLength = second.count
   var result: [UInt8] = []

   for i in 0..<firstLength {
       result.append(first[i] ^ second[i % secondLength])
   }
   
   return result
}



let salsaString = """
280dc9e47f3352c307f6d894ee8d534313429a79c1d8a6021f8a8eabca919cfb685a0d468973625e757490daa981ea6b
3a0a9cab782b4f8603eac28aadde1151005fd46a859df21d12c38eaa858596bf2548000e883d72117466c5c3a580f66b
3a0adee4783a538403b9c29eaac958550242d3778ed9a61918959bf4ca849afa68450f5edc6e311a7f7ed1d7ec
3a0adee461354e8c1cfcc39bef8d5e40525fdc6bc0dee359578290bcca849afa685a1e5c897362
3a0adab0282b5c9719fcc38caac054541b449a62cf9df21d509690af858286f731091a4890786252
390adeaa283358c318f0c08befc157061f59dd65dd9dee1c04c38fad839586ea3b0903489078
390bcfac283a1d8111ebc8d8e8c2554d1b5e852dfed5e955008c8bb48ed094fe3a4d0b45883d731b7b609c
3a0d9ba37a2e539750f8c39caade464313449a78c7d9e3075782deaf8f9180e66845074f9e31
2c17cfe47c335c9750edc59daac9434313549a62cf9df51a1a868ab0839e95bf294f1a4c893d751b7b66d882
3a0adee47d35598a03fac28eefdf54011610d962dcd3f2070ecfdebe989f9fbf3f41015a9e3d73116f60de
200d9bb07a3a4b861cf5c88aaadf54520742d47e859df6000d9992bd99d086f72d09194097713d
2f0cdfe4653a568603b9d88baadf50521a55c82dcbd8e707579796b79995d2f624451d098c7831167b64d5
3a0adaaa283d519a50edc2d8e5d9594300439a79c1dcf2550086deb3849f85bf26461a09947b2e
3a0aceb72838528d03fac49de4ce5406165fce6589d0e71e12c39db79d9180fb3b09014fdb68625e7b7edc82
2f0cdfe47c33489050edc59daac350521b46df2dc1c8e3551885deaa8f839df33d5d074695
27119bb76138568f19fcc9d8e58a54545247d379c19df21d12c38eb98695d2fc295a1a09947b310a727dc5c9a898a3
2f0cdfe46d35498602e9df91f9c842061d569a6adbd8e701579397ac82d093f12c09034696787f0a
390bcfac282f558a03b9df9dedcc43425244d268c0cfa61602918cbd848481bf3c5c1c47db7c660c63
2f0cdfe464344e8650edc59daac3504b1710d56b89dce5011e8c90f6
"""

let salsaArray = salsaString.components(separatedBy: "\n")


// print(hexStringToAscii("2f0cdfe46434 4e 86 50 ed c5 9d aa c3 50 4b 17 10 d5 6b 89 dc e5 01 1e 8c 90 f6").asciiValues)
print(convertHexToAscii(hex: "2f0cdfe464344e8650ede59daa").asciiValues)




func stringToBytes(_ string: String) -> [UInt8]? {
    let length = string.count
    if length & 1 != 0 {
        return nil
    }
    var bytes = [UInt8]()
    bytes.reserveCapacity(length/2)
    var index = string.startIndex
    for _ in 0..<length/2 {
        let nextIndex = string.index(index, offsetBy: 2)
        if let b = UInt8(string[index..<nextIndex], radix: 16) {
            bytes.append(b)
        } else {
            return nil
        }
        index = nextIndex
    }
    return bytes
}

//let bytes = stringToBytes("280dc9e47f3352c307f6d894ee8d534313429a79c1d8a6021f8a8eabca919cfb685a0d468973625e757490daa981ea6b")
//print(bytes)

var arr = Array(salsaArray.map({ stringToBytes($0)! }))


print(result(asciiStringArray: arr, key: "The "))