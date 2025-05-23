//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Natalie Blando Demarco on 5/23/25.
//

import Foundation
import UIKit

class AthleteFormViewController: UIViewController{
    
    var athlete: Athlete?
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var ageTextField: UITextField!
    
    @IBOutlet var teamTextField: UITextField!
    
    @IBOutlet var leagueTextField: UITextField!
    
    @IBAction func saveAction(_ sender: Any) {
        guard let name = nameTextField.text,
            let age = ageTextField.text,
            let league = leagueTextField.text,
            let team = teamTextField.text else { return }
                
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        //LEFT OFF HERE --- Having trouble with segue names
        //performSegue(withIdentifier: unwindToAthleteTableView(segue: unwindAfterSave), sender: self)
        
    }
    
    override func viewDidLoad(){
        
        updateView()
    }
    
    func updateView()
    {
        guard let athlete = athlete
            else {return}
        
            nameTextField.text = athlete.name
            ageTextField.text = athlete.age
            teamTextField.text = athlete.team
            leagueTextField.text = athlete.league
    }
    

    
}
    
