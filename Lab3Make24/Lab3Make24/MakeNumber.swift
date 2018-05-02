
func eval(a: Double, b: Double, c: Double, d: Double, x: Character, y: Character, z: Character) -> String {
    if bingo(x: eval(num1: eval(num1: eval(num1: a, operater: x, num2: b), operater: y, num2: c), operater: z, num2: d))
    {
        return "( ( \(Int(a)) \(x) \(Int(b)) ) \(y) \(Int(c)) ) \(z) \(Int(d))"
    }
    if bingo(x: eval(num1: eval(num1: a, operater: x, num2: eval(num1: b, operater: y, num2: c)), operater: z, num2: d))
    {
        return "( \(Int(a)) \(x) ( \(Int(b)) \(y) \(Int(c)) ) ) \(z) \(Int(d))"
    }
    if bingo(x: eval(num1: a, operater: x, num2: eval(num1: eval(num1: b, operater: y, num2: c), operater: z, num2: d)))
    {
        
        return "\(Int(a)) \(x) ( ( \(Int(b)) \(y) \(Int(c)) ) \(z) \(Int(d)) )"
    }
    if bingo(x: eval(num1: a, operater: x, num2: eval(num1: b, operater: y, num2: eval(num1: c, operater: z, num2: d))))
    {
        return "\(Int(a)) \(x) ( \(Int(b)) \(y) ( \(Int(c)) \(z) \(Int(d)) ) )"
    }
    if bingo(x: eval(num1: eval(num1: a, operater: x, num2: b), operater: y, num2: eval(num1: c, operater: z, num2: d)))
    {
        return "( ( \(Int(a)) \(x) \(Int(b)) ) \(y) ( \(Int(c)) \(z) \(Int(d)) ) )"
    }
    
    return ""
}


func getSolution(a: Double, b: Double, c: Double, d: Double) -> String {
    var n: [Double] = [a, b, c, d]
    var o: [Character] = ["+", "-", "*", "/"]
    for w in 0...3
    {
        for x in 0...3
        {
            if x == w
            {
                continue
            }
            for y in 0...3
            {
                if y == x || y == w
                {
                    continue
                }
                for z in 0...3
                {
                    if z == w || z == x || z == y
                    {
                        continue
                    }
                    for i in 0...3
                    {
                        for j in 0...3
                        {
                            for k in 0...3
                            {
                                let result = eval(a: n[w], b: n[x], c: n[y], d: n[z], x: o[i], y: o[j], z: o[k])
                                if result.isEmpty == false
                                {
                                    return result
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return ""
}


func bingo(x: Double) -> Bool {
    
    return abs(x - 24) < 0.0000001
}

func eval(num1: Double, operater: Character, num2: Double) -> Double {
    switch operater {
    case "+":
        return num1 + num2
    case "-":
        return num1 - num2
    case "*":
        return num1 * num2
    default:
        return num1 / num2
    }
}


let result = getSolution(a: 8, b: 1, c: 3, d: 4)

