import Foundation
import Cocoa


let staticData = StaticData()
let passwordGenerator = PasswordGenerator()

for x in passwordGenerator.humanArray(quantity: 10){
    //print(x)
}


var array : [String] = []

array.append(contentsOf: passwordGenerator.reallyRandomArray(length: 7, quantity: 10000))
array.append(contentsOf: passwordGenerator.standart100HundrPart(quantity: 70000))
array.append(contentsOf: passwordGenerator.standart100PassPart(quantity: 10000))
array.append(contentsOf: passwordGenerator.humanArray(quantity: 100)[...10000])

var md5array = array
var sha1array = array

for i in 0...md5array.count - 1{
    md5array[i] =  md5Encryption(str: md5array[i])
}

for elem in md5array{
    print(elem)
}


for i in 0...sha1array.count - 1{
    var randomString = passwordGenerator.reallyRandomString(of: 7)
    sha1array[i] = sha1Encryption(str: (sha1array[i] + randomString)) + "," + randomString
}

//for elem in sha1array{
//    print(elem)
//}
