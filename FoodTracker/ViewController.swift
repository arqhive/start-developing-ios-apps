// 이 파일은 ViewController라는 UIViewController의 커스텀 서브클래스를 정의한다.
// 현재 이 클래스는 UIViewController의 정의된 모든 동작을 상속한다.
// 해당 동작을 재정의하거나 확장하려면 UIViewController에 정의된 메서드를 오버라이드 하면 된다.

// 템플릿의 구현은 viewDidLoad() 및 didReceiveMemoryWarning() 메서드를 모두 재정의한다.
// 그러나 템플릿의 스텁 구현은 이러한 메소드를 호출하는것 외에는 아무 것도 수행하지 않는다.
// 고유한 코드를 추가하여 이러한 이벤트에 대한 ViewController의 응답을 맞춤 설정 할 수 있다.

// 아울렛은 소스코드 파일에서 인터페이스 객체 (스토리보드에서 추가한 객체)를 참조 할 수 있는 방법을 제공한다.
// 아울렛을 만들렴녀 스토리보드의 특정 개체에서 뷰 컨틀로러 파일로 Control + 드래그 한다.
// 이 작업을 수행하면 뷰 컨트롤러 파일에 객체의 프로퍼티가 만들어지므로 런타임시 코드에서 해당 객체에 액세스 하고 조작 할 수 있다.
import UIKit

// 뷰 컨트롤러가 뷰와 데이터 모델간의 통신 파이프 라인 역할하는 스타일의 앱 디자인을 MVC 패턴이라고 한다.
// 이 패턴에서 모델은 앱의 데이터를 추적하고, 뷰는 사용자 인터페이스를 표시하고 구성하며 컨트롤러는 뷰를 핸들링 한다.
// 사용자의 조치에 응답하고 데이터 모델의 컨텐츠로 뷰를 채우면 컨트롤러는 모델과 뷰간의 통신을 위한 게이트웨이 역할을 한다.
class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    // IBOutlet 속성은 Interface Builder에서 nameTextField 프로퍼티에 연결 할 수 있음을 알려준다.
    
    // weak 키워드는 참조가 시스템이 참조된 오브젝트를 할당 해제하는 것은 방해하지 않음을 나타낸다.
    // 약한 참조는 참조 주기를 방지하는데 (레퍼런스 카운트를 증가시키지 않는) 도움이 된다.
    
    // weak는 reference count를 증가시키지 않는다.
    // 참조하는 인스턴스가 메모리에서 해제되면 ARC는 약한 참조를 nil로 설정한다.
    // 언제든지 nil로 값이 변경 될수 있기 때문에 옵셔널 타입의 변수로 선언되어야 한다.
    
    // 해당 값은 implicitly unwrapped optional로 설정된다.
    // 항상 값을 갖는 옵셔널 이라는 뜻이고 언래핑 할때 nil 체크를 하지 않는다.
    // 처음 초기화된 이후로는 항상 값을 갖고 있다는 것이 보장된다.
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    // 참조를 설정한다.
    @IBOutlet weak var ratingControl: RatingControl!
    
    // 인터페이스 객체에서 값에 액세스하거나 코드에서 인터페이스 객체를 수정하려는 경우
    // 인터페이스 객체에 대한 Outlet만 있으면 된다.
    
    // 아울렛을 사용하면 코드에서 인터페이스 요소를 참조 할 수 있지만
    // 사용자가 요소와 상호 작용 할 때마다 응답 할 방법이 필요하다.
    
    // 뷰 컨트롤러의 컨첸츠뷰가 스토리보드에서 만들어져 로드 될 때 호출된다.
    // 일반적으로 viewDidLoad()는 한번만 호출된다. (컨텐츠 뷰가 생설될때)
    // 스토리보드에서 뷰 컨트롤러를 로드하면 시스템이 뷰 계층을 인스턴스화 하고
    // 모든 뷰 컨트롤러의 Outlet에 적절한 값을 할당 한다.
    // viewDidLoad()가 호출 될 때까지 시스템은 모든 컨트롤러의 Outlet에 유효한 값을 할당한다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // self는 ViewController 클래스 정의의 범위내에서 참조되므로 ViewController 클래스를 참조한다.
        // 델리게이트 콜백을 통해 텍스트 필드의 사용자 입력을 처리한다.
        nameTextField.delegate = self
    }

    // 액션은 앱에서 발생할 수 있는 이벤트에 연결되어있는 코드의 조각이다.
    //MARK: Actions
    // sender 파라미터는 액션 트리거링을 담당하는 오브젝트를 나타낸다 (해당 경우 버튼)
    // IBAction 속성은 메소드가 인터페이스 빌더의 스토리보드에서 연결할 수 있음을 나타낸다.
    // target-action pattern (특정 이벤트가 발생할때 한 개체가 다른 개체에 메세지를 보내는 디자인 패턴)
    // 이벤트는 사용가가 버튼을 탭하는 것이다
    // 행동은 setDefaultLabelText(_)
    // 대상은 ViewController (액션이 정의된 위치)
    // sender는 Button이다.
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        // 레이블의 text 속성을 Default Text로 설정
        mealNameLabel.text = "Default Text"
    }
    
    // 사용자가 이미지를 누르면 사진 라이브러리에서 사진을 선택하거나 자신의 사진을 찍을 수 있어야 한다.
    // 이는 UIImagePickerController 클래스에 동작이 내장되어 있다.
    // 해당 컨트롤러를 사용하기 위해 UIImagePickerControllerDelegate 프로토콜을 채택한다.
    // 기본 탐색을 위한 UINavigationControllerDelegate도 채택한다.
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // 키보드가 열려있다면 닫는다.
        nameTextField.resignFirstResponder()
        // 컨트롤러 인스턴스 생성
        let imagePickerController = UIImagePickerController()
        // 사진 선택만 가능하다.
        imagePickerController.sourceType = .photoLibrary // 열거형의 값이 이미 알려진 경우 언제든지 약식으로 쓸 수 있다.

        // ViewController를 이미지픽커의 델리게이터로 만든다.
        imagePickerController.delegate = self

        // ViewController에서 호출되는 메서드 이다. 암시적인 자체 객체에서 실행된다.
        // imagePickerController에 의해 정의된 뷰 컨트롤러를 표시하도록 요청한다.
        // completion은 완료 핸드러를 나타내는데 여기서는 실행할 필요가 없으므로 nil로 설정한다.
        present(imagePickerController, animated: true, completion: nil)
    }

    // 텍스트필드에서 사용자 입력을 받아 들일 때 텍스트 필트 델리게이터의 도움이 필요하다.
    // 델리게이터는 대신 작용하고 따른 객체와의 통신을 가능하게하는 객체다.
    // 델리게이트 객채(이 경우 텍스트필드)는 다른 객체(델리게이터)에 대한 참조를 유지하며
    // 적절한 시간에 델리게이터에게 메세지를 보낸다.
    // 이 메세지는 델리게이터에게 처리하려고 하거나 처리한 이벤트에 대해 알려준다.
    // 델리게이터는 해당 방법에 영향을 주는 값을 반환하여 응답한다.
    // 적절한 프로토콜을 준수하는 조건하게 다른 객체의 델리게이터 역할을 할 수 있다.
    // 이 경우 UITextFieldDelegate
    // 해당 프로토콜을 채탥하면 ViewController 클래스에 유효한 텍스트필드 델리게이터로
    // 작동 할 수 있음을 컴파일러에게 알린다. 즉, 텍스트 입력을 처리하기 위한 프로토콜의 메소드를
    // 구현 할 수 있으며, ViewController클래스의 인스턴스를 텍스트필드 델리게이터로 지정할 수 있다.
    // UITextFieldDelegate는 8가지의 방법이 정의되어있다 여기서는 2가지를 구현한다.
    // 사용자가 텍스트필드를 탭하면 자동으로 첫 번째 응답자가 된다.
    // 첫 번째 응답자는 주요 이벤트, 모션 이벤트 및 동작 메세지를 포함하여 많은 종류의 앱 이벤트를
    // 수신하기 위해 가장 먼저 사용되는 객체이다. 해당 객체가 첫 번째 응답자에게 라우팅된다.
    // 텍스트 필드가 첫번째 응답자가 된 결과, iOS는 키보드를 표시하고 편집 세션을 시작한다.
    // 사용자가 텍스트 필드 편집을 마치려면 텍스트의 필드의 첫번째 응답자 상태를 포기(사임)해야 한다.
    // 텍스트 필드는 더 이상 앱에서 활성 객체가 아니므로 이벤트가 보다 적절한 객체로 라우팅 되어야 한다.
    // 여기에서 UITextFieldDelegate 메소드 구현이 시작된다.
    // 사용자가 텍스트필드에서 편집을 종료하기 위해 단추를 누를때 텍스트 필드가 첫 번째 응답자 상태를
    // 사임하도록 지정해야 한다.
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 키보드를 숨긴다.
        textField.resignFirstResponder()
        return true // 응답 여부를 나타냄
    }
    
    // 위 함수에서 텍스트필드가 첫 번재 응답자 상태를 사임한후 호출된다.
    // 텍스트 필드에 입력한 정보를 읽고 무언가 실행 할 수 있다.
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    // 사용자가 이미지 픽커의 취소 버튼을 탭하면 호출 된다. UIImagePickerController를 해제 할 수 있다.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 픽커를 사라지게 한다.
        dismiss(animated: true, completion: nil)
    }
    
    // 사용자가 이미지를 선택하면 아래의 메서드가 실행된다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 파라미터 info 딕셔너리는 이미지의 여러 표현을 담고 있을 수 있다. 여기서는 originalImage를 사용한다.
        // 선택된 이미지의 originalImage를 UIImage로 캐스트 한다.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("이미지가 포함된 딕셔너리를 예상했지만 다음과 같은 정보가 포함되어 있습니다.\(info)")
        }
        
        // 이미지 뷰의 이미지를 교체
        photoImageView.image = selectedImage
        
        // 픽커를 숨긴다.
        dismiss(animated: true, completion: nil)
    }
    
}

