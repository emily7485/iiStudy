## 1주차 (6/25~7/1)

- chapter 1,2 학습
- 코드 작성 및 내용 정리
- *6/29(금) 온라인 study* 코드 및 issues 공유

### 01. 간단한 iOS 앱 만들기
* Quiz 앱 만들기
* 모델-뷰-컨트롤러
  모델 : 데이터 저장 ([String])
  뷰 : 사용자에게 보이는 객체 (UILabel, UIButton)
  컨트롤러 : 응용프로그램 관리 (AppDelegate, Viewcontroller)
```swift
import UIKit

class ViewController : UIViewController {
    
    @IBOutlet var questionLabel: UILabel! //질문 라벨
    @IBOutlet var answerLabel: UILabel! //대답 라벨
    
    let questions : [String] = ["What is 7+7?", "What is the capital of Vermont?", "From what is cognac made?"] //질문 배열
    let answers : [String] = ["14", "Montpelier", "Grapes"] //대답 배열
    var currentQuestionIndex: Int = 0 //현재 질문의 인덱스
    
    @IBAction func showNextQuestion(_ sender: Any) { //다음 질문 보여주는 버튼
        currentQuestionIndex += 1 //다음 질문
//        if currentQuestionIndex == questions.count { //책에서의 코드
//            currentQuestionIndex = 0
//        }
        switch currentQuestionIndex { //위의 if문과 같은 동작
        case questions.count: currentQuestionIndex = 0
        default: break
        }
        questionLabel.text = questions[currentQuestionIndex] //질문 공개
        answerLabel.text = "???" //정답은 "???" 처리
    }
    
    @IBAction func showAnswer(_ sender: Any) { //현재 질문에 맞는 정답 보여주는 버튼
        answerLabel.text = answers[currentQuestionIndex] //정답 공개
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex] //첫번째 질문을 앱이 실행될 때 보여줌
    }
}
```

### 02. Swift 언어
* 타입 추론(Type Inference) : 타입을 명시하지 않아도 추론 가능
```swift
var str = "Hello, playground" //초기 값으로 타입을 String으로 추론함
```
* 타입 지정
```swift
var nextYear: Int //Int 타입의 변수 생성
```
* 배열, 딕셔너리, 셋
```swift
var arrayOfInt: [Int] //<- :Array<Int>
var dictionaryOfPaital: [String:String] //<- Dictionary<String,String>
var winningLotteryNumbers: Set<Int>
```
* 이니셜라이저(initializer) : 타입의 새 인스턴스 내용을 초기화하는 역할
  * String, Array, Set : 빈 리터럴 반환
  * Int, Bool : 각각 0, false 의 기본값
```swift
let meaningOfLife = Stirng(number) //Int를 받아 String으로
let availableRooms = Set([205, 411, 412]) //Array를 받아 Set으로
```
* 프로퍼티 : 타입의 인스턴스와 연관된 값
* 인스턴스 메서드 : 특정 타입에 정의하여 그 타입의 인스턴스에서 호출할 수 있는 함수
```swift
let countingUp = ["one", "two"]
countingUp.count //배열의 요소 수를 알려주는 프로퍼티 : 2
countingUp.append("three") //배열 끝에 값을 추가하는 메서드 : ["one", "two", "three"]
let emptyString = ""
emptyString.isEmpty //해당 문자열이 비어있는지 알려주는 Bool 타입의 프로퍼티 : true
```
* 옵셔널 : 타입명에 '?' 기호를 붙여서, 변수가 값을 전혀 저장하지 않을 수도 있다는 것을 나타낸다.
  옵셔널이 아닌 값처럼 사용할 수 없다.
  -> nil일 가능성을 해결해야함! : 언랩핑(unwrapping)
  * 강제 언랩핑
  이름 뒤에 '!' 기호를 붙인다.
  -> nil이 되면 트랩 발생
  * 옵셔널 바인딩
```swift
var reading1: Float?
var reading2: Float?
var reading3: Float?
reading1 = 9.8
reading2 = 9.2
//reading3 = 9.7 //nil이 되면 아래 문장은 트랩을 발생시킴
//let avgReading = (reading1! + reading2! + reading3!) / 3 //강제 언랩핑
if let r1 = reading1, let r2 = reading2, let r3 = reading3 { //옵셔널 바인딩 (if-let문)
    let avgReading = (r1 + r2 + r3) / 3
} else {
    print("Instrument reported a reading that was nil.")
}
```
* 딕셔너리에서 서브스크립팅 : 옵셔널 (해당 키가 없으면 결과값은 nil, 따라서 옵셔널 바인딩 필수)
* 루프와 문자열 삽입
```swift
let countingUp = ["one", "two"]
//for-in문
for i in 0..<countingUp.count {
    let string = countingUp[i]
}
//배열 자체에서 항목 열거
for string in countingUp {
    //'string' 사용
}
//enumerate() 함수 : 해당 인자의 정수와 값을 차례로 반환한다.
for (i, string) in countingUp.enumerated(){ //튜플 반환
    //(0, "one"), (1, "two")
}
```
* 튜플 (tuple) : 순서가 있는 값들의 그룹, 각 멤버는 별개의 타입을 가질 수 있다.
```swift
let nameByParkingSpace = [13: "Alice", 27: "Bob"]
for (space, name) in nameByParkingSpace {
    let permit ="Space \(space): \(name)" //문자열 삽입 시 '\' 사용
}
```
* switch문
  명시적이든, default: 든 반드시 모든 case를 처리해야 한다.  
  
###  online study 내용
* 특별히 어려운 점은 없었음
* 2장 내용 각자 추가로 학습해야 함
* 프로젝트 실습 시, 스스로 코드 작성 후 책과 비교하면서 공부하면 좋을 것 같음

