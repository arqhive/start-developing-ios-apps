// 이 파일은 ViewController라는 UIViewController의 커스텀 서브클래스를 정의한다.
// 현재 이 클래스는 UIViewController의 정의된 모든 동작을 상속한다.
// 해당 동작을 재정의하거나 확장하려면 UIViewController에 정의된 메서드를 오버라이드 하면 된다.

// 템플릿의 구현은 viewDidLoad() 및 didReceiveMemoryWarning() 메서드를 모두 재정의한다.
// 그러나 템플릿의 스텁 구현은 이러한 메소드를 호출하는것 외에는 아무 것도 수행하지 않는다.
// 고유한 코드를 추가하여 이러한 이벤트에 대한 ViewController의 응답을 맞춤 설정 할 수 있다.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

