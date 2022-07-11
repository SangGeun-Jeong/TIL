import UIKit

var numbers: Array<Int> = Array<Int>()
numbers.append(1)
numbers.append(2)
numbers.append(3)

numbers[0]
numbers[1]
numbers[2]

// 중간에 값 삽입 (값, 순서)
numbers.insert(4, at: 2)
numbers

// 중간에 있는 값 삭제 (순서)
numbers.remove(at: 0)
numbers

// 다른 방법으로 Array 생성
var names = [String]()
var names2: [String] = [] // 축약된 방식으로 더 많이 작성

// 딕셔너리 선언
var dic: Dictionary<String, Int> = Dictionary<String, Int>()
var dic2: [String: Int] = [:]
// 초기값이 있는 딕셔너리
var dic3: [String: Int] = ["swift":1]
dic3["java"] = 3
dic3["c"] = 4
dic3
// 값 변경하기
dic["c"] = 7
dic3
// 키 값 제거
dic3.removeValue(forKey: "c")
dic3

// set
var set: Set = Set<Int>()
// set은 축약형 선언이 따로 없음.

set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30) // 중복 안됨.
set

// set 멤버 삭제
set.remove(20)
set
