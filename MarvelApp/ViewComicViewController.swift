//
//  ViewComicViewController.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/10/2020.
//

import UIKit

class ViewComicViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    public var selectedComic: Comic!;
    @IBOutlet var superheroName: UILabel!
    @IBOutlet var comicTitle: UILabel!
    @IBOutlet var superheroDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.comicTitle.text = selectedComic.title;
        self.superheroDescription.text = self.selectedComic.description;

        // Do any additional setup after loading the view.
    }
}

