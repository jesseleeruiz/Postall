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
    
    // MARK: - Outlets
    @IBOutlet var postcard: UIImageView!
    @IBOutlet var colorSelection: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateManyColors()
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
