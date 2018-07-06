## 2주차(7/2~7/15)

- chapter 3,4 학습
- 코드 작성 및 내용 정리
- 7/6(금) 오프라인 study

### 03. 뷰와 뷰 계층 구조
* 뷰와 프레임
  * CGRect : origin과 size를 멤버로 가진다.
    origin - x, y의 두 CGFloat 프로퍼티
    size - width, height의 두 CGFloat 프로퍼티
* 코드로 뷰 추가하기
```swift
override func viewDidLoad() { //뷰가 메모리에 로드된 직후 호출되는 메서드
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 160, y:240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        view.addSubview(firstView)
}
```
-> 포인트 단위 (픽셀 x)
* 라벨 크기 조정 단축키 : `Command` + `=` 또는 Editor -> Size to Fit Content  

###04. 텍스트 입력과 델리게이션
* 텍스트 필드의 Editing Changed 액션 이벤트 작성 후 연결
```swift
@IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        //화씨에서 섭씨로 변환하는 과정
}
```
* 키보드 숨기기
  * becomeFirstResponder()  - 텍스트필드의 키보드를 나타나게 하는 메서드
  * resignFirstResponder() - 텍스트필드의 키보드를 사라지게 하는 메서드
1. 
```swift
@IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
}
```
  2. 제스처 인식기 (gesture recognizer) 사용
     객체 라이브러리에서 `Tap Gesture Recognizer` 를 배경 뷰에 드래그
  3. scene 독의 `Tap Gesture Recognizer`에서 `Conversion View Controller`로 드래그
     `dismissKeyboard:` 메서드에 연결
* 온도 변환 구현
```swift
//1. 화씨 값을 저장할 프로퍼티를 추가한다.
//사용자가 숫자를 입력하지 않을 수 있기 때문에 옵셔널로 사용한다.
var fahrenheitValue: Measurement<UnitTemperature>?
```
```swift
//2. 섭씨 값을 위한 계산 프로퍼티 추가
var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
}
```
```swift
//3. celsiusLabel을 갱신하는 메서드
func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = "\(celsiusValue.value)"
        } else {
            celsiusLabel.text = "???"
        }
}
```
*프로퍼티 옵저버 : 프로퍼티의 값이 바뀔 때 마다 호출, 프로퍼티 선언 다음에 바로 중괄호를 사용해 정의*
```swift
//4. fahrenheigtValue에 프로퍼티 값이 바뀐 후 호출되는 프로퍼티 옵저버 추가
var fahrenheitValue: Measurement<UnitTemperature>?{
        didSet {
            updateCelsiusLabel()
        }
}
```
```swift
//5. 화씨 값을 갱신한다.
@IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
}
```
* 숫자 포맷 지정자
```swift
//.decimal 스타일을 가지고 한자리 소수점 수만을 표시하는 NSNumberFormatter
let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
}()
```
* 델리게이션 : 콜백의 긱체 지향적 방식, 특정 객체의 이벤트 관련 콜백을 모두 받는 단일 델리게이트를 제공
(콜백(callback) : 이벤트보다 먼저 전달되고 이벤트가 발생할 때 마다 호출되는 함수)
* 델리게이트(delegate) 객체 : 콜백으로부터 정보를 저장, 조작, 동작 및 전달
  * 사용자가 텍스트 필드에 내용을 입력하면, 그 텍스트 필드는 사용자가 만든 변경 사항을 허용하는 델리게이트를 요청함 -> 두 번째 소수점을 입력하려고 할 때 그 변경을 허용하지 않음
  * `UITextFieldDelegate` 프로토콜을 따르도록 선언
```swift
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
}
```

* 동메달 과제: 알파벳 문자 허용하지 않기
  CharacterSet 사용
```swift
//Bronze Challenge: Disallow Alphabetic Characters
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
        let replacementStringCharacterSet = CharacterSet(charactersIn: string)
        if !replacementStringCharacterSet.isSubset(of: allowedCharacterSet) {
            print("Rejected (Invalid Character)")
            return false
        }
```
###offline study 내용
* 

