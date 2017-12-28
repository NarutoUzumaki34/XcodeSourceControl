import UIKit

class UIProblemsViewController: UIViewController {

    @IBOutlet var topSecretLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addImage()
    }
    
    private func addImage() {
        let briefcaseImage = UIImageView(image: #imageLiteral(resourceName: "briefcase"))
            briefcaseImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(briefcaseImage)
        
        NSLayoutConstraint.activate([
            briefcaseImage.widthAnchor.constraint(equalToConstant: 300),
            briefcaseImage.heightAnchor.constraint(equalToConstant: 300),
            briefcaseImage.topAnchor.constraint(equalTo: topSecretLabel.bottomAnchor, constant: 10),
            briefcaseImage.centerXAnchor.constraint(equalTo: topSecretLabel.centerXAnchor)
        ])
    }
}
