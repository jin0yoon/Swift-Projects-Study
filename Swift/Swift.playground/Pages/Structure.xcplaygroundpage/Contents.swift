//: [Previous](@previous)

var student : [String : Int] = ["amy":13, "jack":25, "july":21]

struct studentStruct{
    var name:String
    var age:Int
    var phone:String
    
    func introduce() {
        print("\(self.name), \(self.age)")
    }
}

var amy = studentStruct(name: "amy", age: 13, phone: "3233223")

//print("\(amy.name)")
//amy.introduce()


class studentClass{
    var name:String
    var age:Int
    var phone:String
    
    init(name:String, age:Int, phone:String) {
        self.name = name
        self.age = age
        self.phone = phone
    }
    
    func introduce() {
        print("\(self.name), \(self.age)")
    }
}

var amy2 = studentClass(name: "amy", age: 13, phone: "3233223")

//print("\(amy.name)")
//amy.introduce()

//차이
//class -> reference type (참조 타입),데이터 전달 시 메모리 위치 전달
//struct -> value type (값 타입),데이터 전달 시 값 복사하여 전달

struct ValueType{
    var property = 1
}

let firstStructInstance = ValueType()

var secondStructInstance = firstStructInstance

secondStructInstance.property = 2

print("first : \(firstStructInstance.property)")
print("second : \(secondStructInstance.property)")



class ReferenceType{
    var property = 1
}

let firstClassInstance = ReferenceType()

var secondClassInstance = firstClassInstance

secondClassInstance.property = 2

print("first : \(firstClassInstance.property)")
print("second : \(secondClassInstance.property)")


struct movie{
    var name:String
    var year:Int
    var director:String
    var actor:[String]
    
    func introduce() {
        print("이 영화의 제목은 \(name)이고, 상영년도는 \(year), 감독은 \(director), 주연배우는 \(actor) 입니다.")
    }
}

var mymovie = movie(name: "타이타닉", year: 1997, director: "제임스 카메론", actor: ["레오나르도 디카프리오", "케이트 윈슬렛"])
//mymovie.introduce()

//: [Next](@next)
