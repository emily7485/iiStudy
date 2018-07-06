import UIKit

class ViewController : UIViewController {
    
    @IBOutlet var questionLabel: UILabel! //질문 라벨
    @IBOutlet var answerLabel: UILabel! //대답 라벨
    
    let questions : [String] = ["What is 7+7?", "What is the capital of Vermont?", "From what is cognac made?"] //질문 배열
    let answers : [String] = ["14", "Montpelier", "Grapes"] //대답 배열
    var currentQuestionIndex: Int = 0 //현재 질문의 인덱스
    
    @IBAction func showNextQuestion(_ sender: Any) { //다음 질문 보여주는 버튼
        currentQuestionIndex += 1 //다음 질문
        switch currentQuestionIndex {
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


