//: [Previous](@previous)

var students: [String] = ["amy", "jack", "july"]

var studentsAge: [String:Int] = ["amy":13, "jack":25, "july":21]

for i in 0..<students.count{
    print("\(students[i])")
}

for student in students{
    print("\(student)")
}

for student in studentsAge{
    print("\(student.key) : \(student.value)")
}

for (key, value) in studentsAge{
    print("\(key) : \(value)")
}

var str = "DFFJFJJaffjdff"

print(str.lowercased())

//: [Next](@next)
