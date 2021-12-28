import Foundation

class PasswordGenerator {
    
    // really random strings array
    func reallyRandomArray(length: UInt, quantity: UInt) -> [String] {
        var result : [String] = []
        for x in 0...quantity {
            result.append(reallyRandomString(of: length))
        }
        return result
    }
    
    //  strings array from 100 000 top
    func standart100HundrPart(quantity: UInt) -> [String] {
        var result : [String] = []
        for x in 0...quantity {
            result.append(staticData.top100hundr.randomElement()!)
        }
        return result
    }

        //  strings array from 100 top
    func standart100PassPart(quantity: UInt) -> [String] {
        var result : [String] = []
        for x in 0...quantity {
            result.append(staticData.top100hundr.randomElement()!)
        }
        return result
    }
        

        // human pass
        func humanArray(quantity: UInt) -> [String] {
            var names: [String] = ["Ivan", "Masha", "Petya", "vasiliy", "Sasha"]

            var digits: [String] = ["1", "2", "3", "4", "5"]

            var birthdate: [String] = ["1970", "1971", "1972", "1973", "1974", "2000"]
            var result : [String] = []
            for u in 0...100 {
            for x in 0..<names.capacity {
                for y in 0..<digits.capacity {
                    for z in 0..<birthdate.count {
                        let _elem = names[x] + digits[y] + birthdate[z]
                        result.append(_elem)
                    }
                }
            }
           }
            
            return result
        }
    
    
    
    // MARK: -
    
    func reallyRandomString(of length: UInt) -> String {
        let pswdChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        return String((0..<length).compactMap{ _ in pswdChars.randomElement() })
    }
    
}
