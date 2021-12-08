import Foundation

func stringToXor(by key: Int, string: String) -> Int {
    
    let unic = Unicode.Scalar(string)!.value
    let uIntValue_try3 = UInt8(unic)
    
    return key ^ Int(uIntValue_try3)
}

 func divideByKey(keyLength: Int, text: String) -> Array<String>{
        var arr: [String] = Array(repeating: "", count: keyLength)
        
        let arrayOfLetters = text.map(String.init)
        var index = 0
        for char in arrayOfLetters {
            arr[index % keyLength] += char
            index += 1
        }
        
        return arr

 }

let base64String = "G0IFOFVMLRAPI1QJbEQDbFEYOFEPJxAfI10JbEMFIUAAKRAfOVIfOFkYOUQFI15ML1kcJFUeYhA4IxAeKVQZL1VMOFgJbFMDIUAAKUgFOElMI1ZMOFgFPxADIlVMO1VMO1kAIBAZP1VMI14ANRAZPEAJPlMNP1VMIFUYOFUePxxMP19MOFgJbFsJNUMcLVMJbFkfbF8CIElMfgZNbGQDbFcJOBAYJFkfbF8CKRAeJVcEOBANOUQDIVEYJVMNIFwVbEkDORAbJVwAbEAeI1INLlwVbF4JKVRMOF9MOUMJbEMDIVVMP18eOBADKhALKV4JOFkPbFEAK18eJUQEIRBEO1gFL1hMO18eJ1UIbEQEKRAOKUMYbFwNP0RMNVUNPhlAbEMFIUUALUQJKBANIl4JLVwFIldMI0JMK0INKFkJIkRMKFUfL1UCOB5MH1UeJV8ZP1wVYBAbPlkYKRAFOBAeJVcEOBACI0dAbEkDORAbJVwAbF4JKVRMJURMOF9MKFUPJUAEKUJMOFgJbF4JNERMI14JbFEfbEcJIFxCbHIJLUJMJV5MIVkCKBxMOFgJPlVLPxACIxAfPFEPKUNCbDoEOEQcPwpDY1QDL0NCK18DK1wJYlMDIR8II1MZIVUCOB8IYwEkFQcoIB1ZJUQ1CAMvE1cHOVUuOkYuCkA4eHMJL3c8JWJffHIfDWIAGEA9Y1UIJURTOUMccUMELUIFIlc="

let decodedData = Data(base64Encoded: base64String)!
let decodedString = String(data: decodedData, encoding: .utf8)!
    
    var devided = divideByKey(keyLength: 3, text: decodedString)

// print(decodedString)
print("---")

let keyLength = 3

var ResultString : String = "" ///
var columnString: String = "" //
var rowString: String = "" // строка  по ключу 0..255

for locker in 0...255 {
    for x in 0..<keyLength {
        for j in stride(from: 0 + x, to: decodedString.count, by: 3) {
        var i = decodedString.index(decodedString.startIndex, offsetBy: j)
        let symbol : String =  String(decodedString[i])
    
             ResultString.append(Character(UnicodeScalar(stringToXor(by: locker, string: symbol))!))
        }
    }
    print("---------------")
    print()
    // print(ResultString)
    ResultString = ""
}



// xor на каждую треть результат
// получить сконкатинированную тройную строку

var printedResult: String = "" // containts 255 * 3 strings
var oneColumnResult: String = "" // containts 255 strings of single column
var oneRowResult: String = "" // constain one string with a specific key 0...255

for columns in 0..<3 {
    oneColumnResult = ""
    for key in 0...255 {
        oneRowResult = ""
        
        for letterIndex in stride(from: 0 + columns, to: decodedString.count, by: 3) {
            var i = decodedString.index(decodedString.startIndex, offsetBy: letterIndex)
            
            let symbol : String =  String(decodedString[i])
            oneRowResult.append(Character(UnicodeScalar(stringToXor(by: key, string: symbol))!))
            
            
        }
        oneColumnResult.append(oneRowResult)
    }
    printedResult.append(oneColumnResult)
}

// print(printedResult)

var str1: String = ""
var str2: String = ""
var str3: String = ""

for x in stride(from: 0, to: decodedString.count, by: 3) {
    var i = decodedString.index(decodedString.startIndex, offsetBy: x)
    print(x)
    let symbol : String =  String(decodedString[i])
    str1.append(symbol)
}
print("STR1 - ----- --- ")
// print(str1)
for x in stride(from: 1, to: decodedString.count, by: 3) {
    var i = decodedString.index(decodedString.startIndex, offsetBy: x)
    let symbol : String =  String(decodedString[i])
    str2.append(symbol)
}
print("STR2 - ----- --- ")
// print(str2)
for x in stride(from: 2, to: decodedString.count, by: 3) {
    var i = decodedString.index(decodedString.startIndex, offsetBy: x)
    let symbol : String =  String(decodedString[i])
    str3.append(symbol)
}
print("STR3 - ----- --- ")
// print(str3)

var res1 : String = ""
var res11: String = ""
for key in 0...255 {
    res1 = ""
    for letter in 0...devided[0].count {
        var i = devided[0].index(devided[0].startIndex, offsetBy: letter)
        let symbol : String =  String(decodedString[i])
        res1.append(Character(UnicodeScalar(stringToXor(by: key, string: symbol))!))
        
    }
    res11.append(res1)
}
print("res11")
print(res11)
