import UIKit

class HeroHeaderUIView: UIView {
    
    private let playButton: UIButton = {
        let button = UIButton()
        
        button.setTitle(" Riproduci", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.imageView?.tintColor = UIColor.black
        
        
        button.backgroundColor = UIColor.white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let downloadButton: UIButton = {
        
       let button = UIButton()
        
        button.setTitle(" Download", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setImage(UIImage(systemName: "arrow.down.to.line.compact"), for: .normal)
        button.imageView?.tintColor = UIColor.white
        
        button.backgroundColor = UIColor.systemGray2
        button.layer.borderColor = UIColor.systemGray2.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let heroImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "moviePosters")
        
//        imageView.layer.cornerRadius = 15
        return imageView
        
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func applyConstraints() {
        
//        let heroImageConstraints = [
//            heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
//            heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
//            heroImageView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
//            heroImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120)
//        ]
        
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
//        NSLayoutConstraint.activate(heroImageConstraints)
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
