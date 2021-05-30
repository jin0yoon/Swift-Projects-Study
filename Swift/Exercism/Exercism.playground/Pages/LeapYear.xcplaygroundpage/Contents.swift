//: [Previous](@previous)

class Year{
    
    var calendarYear: Int
    
    var isLeapYear: Bool{
        get{
            var result = false
            //여기에 코드를 작성
            if calendarYear % 4 == 0 && (calendarYear % 100 != 0 || calendarYear % 400 == 0){
                    result = true
            }else{
                result = false
            }
            return result
        }
    }
    
    init(calendarYear: Int) {
        self.calendarYear = calendarYear
    }

}

let year = Year(calendarYear: 1996)
if year.isLeapYear{
    print("1996년은 윤년입니다.")
}

year.calendarYear = 1997
if !year.isLeapYear{
    print("1997년은 윤년이 아닙니다.")
}

year.calendarYear = 1900
if !year.isLeapYear{
    print("1900년은 윤년이 아닙니다.")
}

year.calendarYear = 2400
if year.isLeapYear{
    print("2400년은 윤년입니다.")
}


//: [Next](@next)
