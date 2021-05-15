
/*:
# Nth Prime
소수를 구하는 프로그램을 작성해 보자.
예를 들어, 처음 6개의 소수를 나열해 보면
2, 3, 5, 7, 11, 13
이고, 6번째 소수가 13임을 알 수 있다.
N 번째 소수를 구하는 클래스를 작성하라.
## Structure
Prime 클래스가 있다.
또한 숫자가 소수인지 아닌지 판별하는 함수 `isPrime()`도 이미 구현이 되어 있다.
우리는 다음 함수를 작성한다.
`static func nth(_ n: Int) -> Int`
n 번째 소수를 구하여 반환한다.
## Caution
0번째 소수란 존재하지 않으므로, nil 을 반환한다.
*/

class Prime {
    static func nth(_ n: Int) -> Int? {
        if n <= 0 {
            return nil
        }
        var prime:Int = 1
        var count:Int = 0
        //코드 작성
        while true {
          if isPrime(prime){
            count += 1
          }

        if count == n{
          return prime
          }

          prime += 1
        }

//------------------------------------------
        // var num = 1, count = 0
        // while count < n {
        //   num += 1
        //   if Prime.isPrime(num){
        //     count += 1
        //   }
        // }
        // return num


//         // var prime:Int = 1
//         // var count:Int = 0
//         // //코드 작성
//         // while true {
//         //   if isPrime(prime){
//         //     count += 1
//         //     if count == n{
//         //       return prime
//         //     }
//         //   }
//         // prime += 1

//         // }


        
        
        
    }
    
    static func isPrime(_ num: Int) -> Bool {
        
        if num == 1 {
            return false
        } else if num == 2 {
            return true  //소수
        }
        
        for i in 2..<num {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
}

if (2 == Prime.nth(1)){
    print("1번째 수 정답")
}

if (3 == Prime.nth(2)){
    print("2번째 수 정답")
}

if (13 == Prime.nth(6)){
    print("6번째 수 정답")
}

if (nil == Prime.nth(0)){
    print("0번째 수 정답")
}

//답 도출에 시간이 소요 된다.
if (104_743 == Prime.nth(10_001)){
    print("10001번째 수 정답")
}




// var primeNumArray:[Int] = [1,3,5,7,11,13,17,19]

// var greetings:[String] = ["Hi", "Hello", "안녕"]

// print(greetings[2])

// var airports:[String:String] = ["ICN":"Incheon", "SFO":"SanFrancisco"]

// print(airports["ICN"])

// airports["LAX"] = "LosAngeles"

// print(airports["LAX"])
