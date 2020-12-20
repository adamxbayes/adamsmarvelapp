//
//  ComicCollectionViewCell.swift
//  MarvelApp
//
//  Created by Adam Bayes on 16/10/2020.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var comicBookLabel: UILabel!
    
    override func awakeFromNib() {
        layer.cornerRadius = 4;
    }

    func setup(comic: Comic) {
        let ext = comic.thumbnail?.extension
        let path = comic.thumbnail?.path
        let urlPath = ( path ?? "" ) + "." + ( ext ?? "" )
        let url = URL(string: urlPath )!
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async() { [weak self] in
                self?.imageView.image = UIImage(data: data)
            }
            
            
              
         
        }
        self.comicBookLabel.text = comic.title
        
       
    }

    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}


