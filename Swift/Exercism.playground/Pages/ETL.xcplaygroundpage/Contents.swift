//: [Previous](@previous)

/*:
 # E T L
 
 ETL 은 어떤 데이터 소스로부터 데이터를 추출해 적절한 포멧으로 변환하여 다른 시스템에서 이용할 수 있도록 해 주는 과정을 이른다. 추출Extract - 변환Transform - 적재Load 의 세 과정으로 구성된다.
 
 우리는 이 중에서 '변환' 과정을 연습해 보자.
 
 변환하고자 하는 방식은 다음과 같다.
 
 각 알파벳에 점수를 부여하는 시스템이 있다고 해 보자. 기존의 시스템은 각 알파벳에 대한 점수를 다음과 같이 저장했다.
 
 - 1 점: "A", "E", "I", "O", "U", "L", "N", "R", "S", "T",
 - 2 점: "D", "G",
 - 3 점: "B", "C", "M", "P",
 - 4 점: "F", "H", "V", "W", "Y",
 - 5 점: "K",
 - 8 점: "J", "X",
 - 10 점: "Q", "Z",
 
 새로운 시스템에서는, 점수를 계산하는 것을 더 빠르고 쉽게 하기 위하여, 각 알파벳들에 대응하는 점수들을 모두 따로 저장하려고 한다. 또한 알파벳을 소문자로 저장할 것이다. 그러면 아래와 같은 형태가 될 것이다.
 
 - "a" 는 1점.
 - "b" 는 3점.
 - "c" 는 3점.
 - "d" 는 2점.
 - "e" 는 1점.
 - 등등.
 
 이와 같은 방식으로 변환하고자 할 때, 주어진 원래의 알파벳과 점수 데이터 포멧을 새로운 포멧으로 변환하는 클래스를 작성하라.
 
 ## Structure
 
 ETL 클래스를 작성한다.
 
 다음 함수를 작성한다.
 
 `class func transform(_ source: [Int: [String]]) -> [String: Int]`
 
 앞서 설명한 조건에 따라 주어진 데이터를 새로운 구조로 변환하여 반환한다.
 ## Hint
 
 * Dictionary 관련
 https://zeddios.tistory.com/129
 
 * 소수점으로 바꾸기 => lowercased() 함수 이용
 https://developer.apple.com/documentation/swift/string/1641392-lowercased
 */

class ETL {
    
    class func transform(_ source: [Int: [String]]) -> [String: Int] {
        var converted = [String:Int]() //변환된 결과 dictionary를 저장하는 converted 변수
        //코드 작성
//        print(source)
        for (key, value) in source{
            for i in value{
//                print(i, key)
                converted.updateValue(key, forKey: i.lowercased())
            }
            
        }
        return converted
    }
}

class EtlTests {
    
    func testTransformOneValue() {
        let old = [ 1: [ "A" ] ]
        let expected =  ["a": 1 ]
        let results = ETL.transform(old)
        if results == expected{
             print("test1 통과")
        }
    }
    
    func testTransformMoreValues() {
        let old = [ 1: [ "A", "E", "I", "O", "U" ] ]
        let expected =  ["a": 1, "e": 1, "i": 1, "o": 1, "u": 1 ]
        let results = ETL.transform(old)
        if results == expected{
             print("test2 통과")
        }
    }
    
    func testMoreKeys() {
        let old = [ 1: [ "A", "E" ], 2: ["D", "G"] ]
        let expected =  ["a": 1, "e": 1, "d": 2, "g": 2 ]
        let results = ETL.transform(old)
        if results == expected{
             print("test3 통과")
        }
    }
    
    func testFullDataSet() {
        let old = [ 1: [ "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ],
                    2: [ "D", "G" ],
                    3: [ "B", "C", "M", "P" ],
                    4: [ "F", "H", "V", "W", "Y" ],
                    5: [ "K"],
                    8: [ "J", "X" ],
                    10: [ "Q", "Z" ]
        ]
        let expected = [  "a": 1, "b": 3, "c": 3, "d": 2, "e": 1,
                          "f": 4, "g": 2, "h": 4, "i": 1, "j": 8,
                          "k": 5, "l": 1, "m": 3, "n": 1, "o": 1,
                          "p": 3, "q": 10, "r": 1, "s": 1, "t": 1,
                          "u": 1, "v": 4, "w": 4, "x": 8, "y": 4,
                          "z": 10 ]
        
        let results = ETL.transform(old)
        if results == expected{
             print("test4 통과")
        }
    }
    
}

let etlTests = EtlTests()
etlTests.testTransformOneValue()
etlTests.testTransformMoreValues()
etlTests.testMoreKeys()
etlTests.testFullDataSet()


//: [Next](@next)
