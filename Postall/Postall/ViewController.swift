//
//  ViewController.swift
//  Postall
//
//  Created by Jesse Ruiz on 11/2/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var colors = [UIColor]()
    var image: UIImage?
    
    var topText = "Visit London"
    var topFontName = "Helvetica Neue"
    var topColor = UIColor.white
    
    var bottomText = "Home of Sherlock Holmes, Paddington Bear, and James Bond"
    var bottomFontName = "Helvetica Neue"
    var bottomColor = UIColor.white
    
    // MARK: - Outlets
    @IBOutlet var postcard: UIImageView!
    @IBOutlet var colorSelection: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateManyColors()
        renderPostcard()
    }
    
    // MARK: - Methods
    /// Generates a broad range of colors by running two loops to generate a variety of colors at different hues and saturations.
    private func generateManyColors() {
        colors += [.black, .gray, .white, .yellow, .orange, .red, .magenta, .purple, .blue, .cyan, .green]
        
        for i in 0 ... 9 {
            for j in 1 ... 10 {
                let color = UIColor(hue: CGFloat(i) / 10,
                                    saturation: CGFloat(j) / 10,
                                    brightness: 1,
                                    alpha: 1)
                colors.append(color)
            }
        }
    }
    
    /// This method will draw the background image and two pieces of text on top. UIGraphicsImageRenderer will be used along with attributed strings so we can use colors, fonts, and text alignment.
    private func renderPostcard() {
        // Define the total drawing space
        let drawRect = CGRect(x: 0, y: 0, width: 3000, height: 2400)
        
        // Define where to draw the top and bottom text
        let topTextRect = CGRect(x: 250, y: 200, width: 2500, height: 800)
        let bottomTextRect = CGRect(x: 250, y: 1800, width: 2500, height: 600)
        
        // Create UIFont instances out of the font names, providing fallbacks on failure
        let topFont = UIFont(name: topFontName, size: 350) ?? UIFont.systemFont(ofSize: 250)
        let bottomFont = UIFont(name: bottomFontName, size: 150) ?? UIFont.systemFont(ofSize: 100)
        
        // Create a centered paragraph style
        let centered = NSMutableParagraphStyle()
        centered.alignment = .center
        
        // Wrap that in attributed strings with the user's colors
        let topTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: topColor, .font: topFont, .paragraphStyle: centered]
        let bottomTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: bottomColor, .font: bottomFont, .paragraphStyle: centered]
        
        // Start rendering at the correct size
        let renderer = UIGraphicsImageRenderer(size: drawRect.size)
        
        postcard.image = renderer.image { ctx in
            // Fill the entire screen in gray
            UIColor.gray.set()
            ctx.fill(drawRect)
            
            // Draw the user's image at the top-left corner
            image?.draw(at: CGPoint(x: 0, y: 0))
            
            // Draw the top and bottom text
            topText.draw(in: topTextRect, withAttributes: topTextAttributes)
            bottomText.draw(in: bottomTextRect, withAttributes: bottomTextAttributes)
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = colors[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        return cell
    }
}
