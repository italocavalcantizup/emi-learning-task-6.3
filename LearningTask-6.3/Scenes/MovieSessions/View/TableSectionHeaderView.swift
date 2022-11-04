
import UIKit

class TableSectionHeaderView: UITableViewHeaderFooterView {
    
    static var heightConstante: CGFloat = 48
    static var reuseId: String {
        return String(describing: self) // Reuse Identifier
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder: has not been implemented)")
    }
    
    // MARK: - subviews
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .init(named: "Heart")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .tertiaryLabel
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .tertiaryLabel
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            iconImageView, label
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return stack
    }()
    
    private func setup() {
        addViews()
    }
    
    func setup(_ cinema: Cinema) {
        label.text = cinema.name
        iconImageView.image = UIImage(named: "Heart")
    }
    
    func addViews() {
        addSubview(containerStackView)
        addSubview(iconImageView)
        addSubview(label)
    }

}
