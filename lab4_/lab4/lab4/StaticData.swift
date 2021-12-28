import Foundation

class StaticData {
      var top100pas : [String] = []
      var top100hundr : [String] = []
    
    init() {
        let pathURL = URL(fileURLWithPath: (NSString(string:"/Users/apple/Desktop/top100.txt").expandingTildeInPath ))
        if FileManager.default.fileExists(atPath: pathURL.path) { print(1) }

        let s = StreamReader(url: pathURL)
        for _ in 1...100 {
            if let line = s?.nextLine() {

                top100pas.append(line)
            }
        }
        
        let pathURL1 = URL(fileURLWithPath: (NSString(string:"/Users/apple/Desktop/top100hundr.txt").expandingTildeInPath ))
        if FileManager.default.fileExists(atPath: pathURL1.path) { print(1) }

        let s1 = StreamReader(url: pathURL1)
        for _ in 1...100000 {
            if let line = s1?.nextLine() {
                top100hundr.append(line)
            }
        }
    }
    
}
