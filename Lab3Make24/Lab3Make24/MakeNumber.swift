
//////////SHOW ME//////////
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

//////////DONE//////////
public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

func calculateResult(exp: String) -> Bool {
    let postExpression = convertToPostFix(input: exp)
    let result = calculate(input: postExpression)
    return bingo(x: result)
}

func calculate(input: String) -> Double {
    var stack = Stack<Double>()
    var d1:Double = 0
    var d2:Double = 0
    var d3:Double = 0
    for i in 0..<input.count {
        let ch = Array(input)[i]
        if ch >= "0" && ch <= "9" {
            stack.push(Double(String(ch))!)
        }
        else {
            if stack.isEmpty == false {
                d2 = stack.pop()!
            }
            if stack.isEmpty == false {
                d1 = stack.pop()!
            }
            switch ch {
            case "+":
                d3 = d1 + d2
            case "-":
                d3 = d1 - d2
            case "×":
                d3 = d1 * d2
            default:
                d3 = d1 / d2
            }
            stack.push(d3)
        }
    }
    return stack.pop()!
}


func convertToPostFix(input: String) -> String {
    var stringBuilder = ""
    var operatorStack = Stack<Character>()
    let length = input.count
    for i in 0..<length {
        let ch = Array(input)[i]
        print("ch: \(ch)")
        if ch >= "0" && ch <= "9" {
            stringBuilder += String(ch)
        }
        //left bracket
        if ch == "(" {
            operatorStack.push(ch)
        }
        //operator
        if isOperator(op: ch) {
            if operatorStack.isEmpty == true {
                operatorStack.push(ch)
            }
            else {
                var stackTop = operatorStack.top
                if priority(ch: ch) > priority(ch: stackTop!) {
                    operatorStack.push(ch)
                }
                else {
                    stackTop = operatorStack.pop()
                    stringBuilder += String(stackTop!)
                    operatorStack.push(ch)
                }
                
            }
        }
        
        //right bracket
        if ch == ")" {
            var top = operatorStack.pop()
            while top != "(" {
                stringBuilder += String(top!)
                top = operatorStack.pop()
            }
        }
        
    }
    while operatorStack.isEmpty == false {
        stringBuilder += String(operatorStack.pop()!)
    }
    //print(stringBuilder)
    return stringBuilder
}

func priority(ch: Character) -> Int {
    if ch == "+" || ch == "-" {
        return 1
    }
    if ch == "×" || ch == "÷" {
        return 2
    }
    return 0
}

func isOperator(op: Character) -> Bool {
    return (op == "+") || (op == "-") || (op == "×") || (op == "÷")
}

