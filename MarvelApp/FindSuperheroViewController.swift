//
//  FindSuperheroViewController.swift
//  MarvelApp
//
//  Created by Adam Bayes on 02/10/2020.
//

import Foundation
import UIKit

public class FindSuperHeroViewController: UIViewController {
    

    @IBOutlet var findSuperHeroErrorMessage: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    @IBOutlet var superHeroNameLabel: UILabel!

    public var heroSelected: Int!
    var dataService: DataService!
    var comics: [Comic] = []
    
    fileprivate func getSuperhero() {
        self.dataService = DataService(session: URLSession.shared, resourcePath: "character")
        let url = dataService.buildUrl(path: "characters/\(self.heroSelected!)")
        dataService.getSuperHero(url: URL(string: url)!) {(result) in DispatchQueue.main.async {
            switch (result) {
            case .success(let result):
                guard let hero = result.data else {print("no hero sorry"); return }
                
                self.superHeroNameLabel.text = hero.results[0].name
                
            case .failure(let error) :
                print("We have an error \(error)")
                
            }
        }
        }
    }
    
   
    public override func viewDidLoad() {
        comicsCollectionView.dataSource = self
        comicsCollectionView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
            getSuperhero()
            getComicsForSuperhero(id: self.heroSelected)
    }
    
  
    public func getComicsForSuperhero(id characterId: Int) -> Void {
        self.dataService = DataService(session: URLSession.shared, resourcePath: "comics")
        let url = dataService.buildUrl(path: "characters/\(self.heroSelected!)/comics")
   
        dataService.getComicsBySuperheroId(url: URL(string: url)!) {(result) in DispatchQueue.main.async {
            DispatchQueue.main.async {
                switch(result) {
                case .success(let result):
                    guard let comics = result.data else {print("no comics"); return }
                    self.comics = comics.results!
                    self.comicsCollectionView.reloadData()
            
                case .failure(let error) : print("We have an error \(error)")
                }
            }
        }}
    }

    @IBAction func checkFindSuperheroValidity(_ sender: UITextField) {
        guard let text = sender.text else {return}
        
        if text.isValid(.searchForSuperhero) {
            self.findSuperHeroErrorMessage.text = ""
        } else {
            self.findSuperHeroErrorMessage.text = "Search for super hero cannot be empty!"
        }
    }
    
}

extension FindSuperHeroViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicCell", for: indexPath) as! ComicCollectionViewCell
        cell.setup(comic: comics[indexPath.item])
   
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 2
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = 250
        return CGSize(width: width, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedComic = comics[indexPath.item]
        let vc = storyboard?.instantiateViewController(withIdentifier: "viewComicViewController") as! ViewComicViewController
            vc.selectedComic = selectedComic
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
    
}
