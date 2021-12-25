import Foundation

let semaphore = DispatchSemaphore(value: 0)

func Next(a:Int, c:Int, last: Int) -> Int {
    let last = ((a * last) + c) % 4294967296;
    return last;
}

func printResult(){
    var gameResult: GameResult
    
    var x1: Int = 0
    NetworkLayer.fetchData { GameResult in
        x1 = GameResult.realNumber
        semaphore.signal()
    }
    semaphore.wait()

    var x2: Int = 0

    NetworkLayer.fetchData { GameResult in
        x2 = GameResult.realNumber
        semaphore.signal()
    }
    semaphore.wait()

    var x3: Int = 0

    NetworkLayer.fetchData { GameResult in
        x3 = GameResult.realNumber
        semaphore.signal()
    }
    semaphore.wait()
    
    
    var M: Int = 0
    var m = 4294967296
    var a: Int64 = 0
    
    for Mult in -1_000_000..<Int.max {
        
        var doubleTemp: Double = Double(x2) - Double(x3) - Double(Mult * m)
        
        var doubleA: Double = doubleTemp / Double(x1 - x2)
        if floor(doubleA) == doubleA
        {
            a = Int64(doubleA);
            print("a = \(a)")
            M = Mult
            break;
        }
    }
    
    var c: Int = 0 // x2 - a * x1 + m * M;

    let coef = Int(a) * (x1 + x2)
    let temp = (x3 + x2 - m * M - coef) / 2
    c = temp
    if (c < 0)
    {
        while c < Int.min {
            c = c + m
        }
    }
    if (c > 0)
    {
        while c > Int.max {
            c = c - m
        }
    }
    
    print("c = \(c)")
    
    print("next = \(Next(a: Int(a), c: Int(c), last: x3))")
    
    c = 1013904223

}

printResult()
