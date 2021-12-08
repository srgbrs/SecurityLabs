import Foundation

extension String {
    func utf8DecodedString()-> String {
        let data = self.data(using: .utf8)
        let message = String(data: data!, encoding: .nonLossyASCII) ?? ""
        return message
    }
    
    func utf8EncodedString()-> String {
        let messageData = self.data(using: .nonLossyASCII)
        let text = String(data: messageData!, encoding: .utf8) ?? ""
        return text
    }
}


let hexString : String = "7958401743454e1756174552475256435e59501a5c524e176f786517545e475f5245191772195019175e4317445f58425b531743565c521756174443455e595017d5b7ab5f525b5b58174058455b53d5b7aa175659531b17505e41525917435f52175c524e175e4417d5b7ab5c524ed5b7aa1b174f584517435f5217515e454443175b524343524517d5b7ab5fd5b7aa17405e435f17d5b7ab5cd5b7aa1b17435f5259174f584517d5b7ab52d5b7aa17405e435f17d5b7ab52d5b7aa1b17435f525917d5b7ab5bd5b7aa17405e435f17d5b7ab4ed5b7aa1b1756595317435f5259174f58451759524f4317545f564517d5b7ab5bd5b7aa17405e435f17d5b7ab5cd5b7aa175650565e591b17435f525917d5b7ab58d5b7aa17405e435f17d5b7ab52d5b7aa1756595317445817585919176e5842175a564e17424452175659175e5953524f1758511754585e59545e53525954521b177f565a5a5e595017535e4443565954521b177c56445e445c5e17524f565a5e5956435e58591b17444356435e44435e54565b17435244434417584517405f564352415245175a52435f5853174e5842175152525b174058425b5317445f584017435f52175552444317455244425b4319"

let hexS = "4e"

/// разбиение string из двух символов на отдельные символы
let index = hexS.index(hexS.endIndex, offsetBy: -1)
let mySubstring : String = String(hexS.suffix(from: index)) // playground

let index2 = hexS.index(hexS.startIndex, offsetBy: 1)
//let mySubstring1 = hexS.prefix(from: index2) // playground
let s = hexS.prefix(upTo: index2)

print(mySubstring)
print(s)

//let char1 = Character(mySubstring)
//let char2 = Character(s)
// let str = String(mySubstring.cString(using: NSUTF8StringEncoding))
let str = mySubstring.utf8DecodedString()

let myChar: Character = "a"
print(myChar.unicodeScalars.first!.value - Unicode.Scalar("0").value) // 3: UInt32

print(Int8(str))
print(s.unicodeScalars)




let uIntValue: UInt8 = UInt8(Unicode.Scalar("a").value) // 97
print("uIntValue:\(uIntValue)")

let uIntValue1: UInt32 = Unicode.Scalar("a").value
print()
let binaryString = String(uIntValue, radix: 2)
print("radix:\(binaryString)")

print(myChar.asciiValue)

func pad(string : String, toSize: Int) -> String {
  var padded = string
  for _ in 0..<(toSize - string.count) {
    padded = "0" + padded
  }
    return padded
}


print(pad(string: binaryString, toSize: 32))  // 00010110

var binaryInt = Int("1", radix: 2)
print(pad(string: String(binaryInt!), toSize: 4))

print(binaryInt)


func isNumeric() {
    
}

let uIntValue_try1: UInt8 = UInt8(Unicode.Scalar("e").value) // 101
let uIntValue_try2: UInt8 = UInt8(Unicode.Scalar("2").value) // 97

let zero: UInt8 = UInt8(Unicode.Scalar("0").value) // 48
let aLettter: UInt8 = UInt8(Unicode.Scalar("a").value) // 97

print("AA A\(uIntValue_try1)")

var array = [UInt8]()
array.append(uIntValue_try1)
array.append(uIntValue_try2)

for elem in array {
    
}

print(uIntValue_try1 - aLettter + 10)
print(uIntValue_try2 - zero)

let result1 = uIntValue_try1 - aLettter + 10
let result2 = uIntValue_try2 - zero

let r = result2 * 16 + result1
print(UnicodeScalar(r))



// loop

print(" --- LOOP --//")

var general : String = ""

for element in stride(from: 0, to: hexString.count, by: 2) {
    // print(hexString.In[element])
    var index = hexString.index(hexString.startIndex, offsetBy: element)
    //print(hexString[index])
    let c = Character(extendedGraphemeClusterLiteral: hexString[index])
    // print(c)
    var b : String = String(hexString[index])
    var unic = Unicode.Scalar(b)!.value

    var uIntValue_try3: UInt8 = UInt8(unic)
    
    var r1: Int
    var r2: Int
    
    if hexString[index].isNumber {
        print("IS number")
         r1 = Int(uIntValue_try3 - zero)
    } else {
        r1 = Int(uIntValue_try3 - aLettter + 10)
    }
    
    // r1 - первый регистр
     index = hexString.index(hexString.startIndex, offsetBy: element+1)
     b = String(hexString[index])
     unic = Unicode.Scalar(b)!.value
     uIntValue_try3 = UInt8(unic)
    
    
    if hexString[index].isNumber {
        print("IS number")
         r2 = Int(uIntValue_try3 - zero)
    } else {
        r2 = Int(uIntValue_try3 - aLettter + 10)
    }
    // для char и char+1 прдсчитать 0..15 значение в зависимости от того Numeric или NotNumeric
    
    print("r1: \(r1) , r2: \(r2) ")
    
    // перевести два int в один int 0..255
    
    //print("res 1: \(r1 * 16 + r2 ) ")
    let rez = r1 * 16 + r2
     print(UnicodeScalar(rez))
    let z = Int(r)
    
    general += String(UnicodeScalar(rez)!)
    // перевести int в asccii значение и добавить в результирующую строку.
    
}

print(general)

for index in 0...255 {
    var resultString : String = ""
    let encryptionKey = index
    
    for x in 0...general.count-1 {
    
    
    var i = general.index(general.startIndex, offsetBy: x)
    let symbol : String =  String(general[i])
    
    let unic = Unicode.Scalar(symbol)!.value
    let uIntValue_try3 = UInt8(unic)
    
    let xorResult : Int = index ^ Int(uIntValue_try3)
    resultString.append(Character(UnicodeScalar(xorResult)!))
    }
    
    // xor adding
    
    //xor byte result deciper
    print ()
    print()
    print(resultString)
}
