import Foundation


struct Account: Codable {
    var id: String
    var money: Int
    var deletionTime: String
}

struct GameResult: Codable {
    var message: String
    var account: Account
    var realNumber: Int
}


