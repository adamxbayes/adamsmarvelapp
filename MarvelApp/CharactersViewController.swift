//
//  ViewController.swift
//  MarvelApp
//
//  Created by Adam Bayes on 01/10/2020.
//

import UIKit
import CoreData

class CharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var navBar: UINavigationBar!
    var heroes:  [Superhero] = [];
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;

    
  
    
    override func viewDidLoad() {
        loading.hidesWhenStopped = true
        loading.startAnimating()
        let dataService = DataService(session: URLSession.shared)
        let path = "characters"
        let url = dataService.buildUrl(path: path)
   
        dataService.getCharacters(url: URL(string: url)!) {(result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    guard let characters = result.data else {print("no characters"); return }
                    self.heroes = characters.results ?? []
                    print(self.heroes);
                    self.loading.stopAnimating()
                    self.tableView.reloadData()
                    break;
                case .failure(let error):
                    print("Error! \(error)")
                }
            }
            
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableRowCell", for: indexPath)
    
        var currentCell = heroes[indexPath.row]
        cell.textLabel?.text = currentCell.name
       
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableRowCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Data provided by Marvel. © 2014 Marvel";
    }
    
    func navigateThrough(id id: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FindSuperHeroViewController") as! FindSuperHeroViewController
        vc.heroSelected = id
    
        navigationController?.pushViewController(vc, animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .normal, title: "View") {
            (contextualAction, view, boolValue) in
            let currentCell = self.heroes[indexPath.row]
            self.navigateThrough(id: Int(currentCell.id))
            
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
        return swipeActions
    }
}

//extension UIViewController {
//    func save(value: String) {
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            let context = appDelegate.persistentContainer.viewContext
//            
//            guard let entityDescription = NSEntityDescription.entity(forEntityName: "TestEntity", in: context) else {return}
//            
//            let newValue = NSManagedObject(entity: entityDescription, insertInto: context)
//            newValue.setValue(value, forKey: "testValue")
//            
//            do {
//                try context.save()
//                print("saved \(value) successfully")
//                
//            } catch{
//                print("error saving \(value)")
//            }
//        }
//    }
//    
//    func retrieveValues(){
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            let context = appDelegate.persistentContainer.viewContext
//            let fetchRequest = NSFetchRequest<TestEntity>(entityName: "TestEntity");
//            
//            do {
//                let results = try context.fetch(fetchRequest);
//                
//                for result in results {
//                    if let testValue = result.testValue {
//                        print("\(result.testValue) retrieved!")}
//                    else {
//                        print("Nothing found!")
//                        
//                    }
//                }
//            }
//        }
//    }
//}
