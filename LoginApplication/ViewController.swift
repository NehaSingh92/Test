
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    var loginService: LoginService!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginService = LoginServiceDelegate(delegate: self)
    }
    
    @IBAction func tappedLogin(_ sender: UIButton) {
        loginService.login(withUsername: username.text, password: password.text)
        
    }
}

extension ViewController: LoginActionService {
    func loginSuccessfull(withUser user: User) {
        //showAlert(withTitle: "Success", message: "Hello \(user.name)")
        let alert = UIAlertController(title: "Success", message: "Logged In", preferredStyle: .alert)
        let action = UIAlertAction(title: "OKay", style: .default) { (action) -> Void in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TableView")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
       
    }
    
    func handle(error: Error) {
        showAlert(withTitle: "Error", message: error.localizedDescription)
    }
}

