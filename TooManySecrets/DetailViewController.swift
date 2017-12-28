import UIKit

class DetailViewController: UIViewController {
    var rowType: RowType!
    
    @IBOutlet var imageView: UIView!
    @IBOutlet var textView: UIView!
    @IBOutlet var briefcaseImage: UIImageView!
    @IBOutlet var briefcaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawImage()
        drawText()
        addTouchEvents()
    }

    func configure(rowType: RowType) {
        self.rowType = rowType
    }
}

//MARK: - Touch Events
extension DetailViewController {
    fileprivate func addTouchEvents() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(briefcaseImageTapped(tapGestureRecognizer:)))
        
        briefcaseImage.isUserInteractionEnabled = true
        briefcaseImage.addGestureRecognizer(tap)
    }
    
    @IBAction func briefcaseButtonTapped(_ sender: Any) {
        print("button tapped")
    }
    
    @objc func briefcaseImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let problemsViewController = UIProblemsViewController(nibName: "UIProblemsViewController", bundle: nil)
        navigationController?.pushViewController(problemsViewController, animated: true)
    }
}

//MARK: - CALayer Stuff
extension DetailViewController {
    
    fileprivate func drawImage() {
        let myLayer = CALayer()
            myLayer.frame = imageView.bounds
            myLayer.contents = rowType.image.cgImage
        
        imageView.layer.addSublayer(myLayer)
    }
    
    fileprivate func drawText() {
        let fontName = "HelveticaNeue" as CFString

        let textLayer = CATextLayer()
            textLayer.font = CTFontCreateWithName(fontName, 16, nil)
            textLayer.fontSize = 16
            textLayer.frame = CGRect(x: 0, y: 80, width: textView.bounds.width, height: 50)
            textLayer.alignmentMode = kCAAlignmentCenter
            textLayer.foregroundColor = UIColor.white.cgColor
            textLayer.string = rowType.string
                
        textView.layer.addSublayer(textLayer)
    }
}
