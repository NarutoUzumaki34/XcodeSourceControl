import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordValue: UILabel!
    @IBOutlet var imageContainer: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        commonInit()
    }
    
    override func prepareForReuse() {
        imageContainer.subviews.forEach { $0.removeFromSuperview() }
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: adding images
extension CustomCell {
    func add(image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            imageView.image = image

        imageContainer.addSubview(imageView)
    }
}

//MARK: - Dynamic Sizing font - iOS 10
extension CustomCell {
    
    func commonInit() {
        setAccessibilityProperties()
        
        if #available(iOS 10, *) {
            commonInit_iOS10()
        } else {
            commonInit_iOS7plus()
        }
    }
    
    private func setAccessibilityProperties() {
        passwordLabel.isAccessibilityElement = true
        passwordValue.isAccessibilityElement = true
    }
    
    func setPassword(password: String) {
        passwordValue?.text = password
        passwordValue.accessibilityValue = password
    }
}

@available(iOS 10, *)
extension CustomCell {
    fileprivate func commonInit_iOS10() {
        passwordLabel.adjustsFontForContentSizeCategory = true
        passwordValue.adjustsFontForContentSizeCategory = true
    }
}

@available(iOS 7, *)
extension CustomCell {
    
    fileprivate func commonInit_iOS7plus() {
        assignFonts()
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(self, selector: #selector(userChangedTextSize(notification:)), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
    }
    
    @objc func userChangedTextSize(notification: NSNotification) {
        assignFonts()
    }
    
    fileprivate func assignFonts() {
        passwordLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        passwordValue.font = UIFont.preferredFont(forTextStyle: .body)
    }
}


