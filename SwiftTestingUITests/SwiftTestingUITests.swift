//
//  SwiftTestingUITests.swift
//  SwiftTestingUITests
//
//  Created by Burak Afyonlu on 7.05.2023.
//

import XCTest

final class SwiftTestingUITests: XCTestCase {

    

    func testAddButton() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
      let addButton =  app.navigationBars["SwiftTesting.View"].buttons["Add"]
        
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Item"]/*[[".cells.textFields[\"Enter Item\"]",".textFields[\"Enter Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let okButton = elementsQuery.buttons["OK"]
       let addedCell = app.tables.cells.containing(.staticText, identifier:"my To Do").element
                
        addButton.tap()
        textField.tap()
        textField.typeText("my To Do")
        okButton.tap()
        XCTAssertTrue(addedCell.exists)
        
        
    }
    
    
    func testDeleteButton() throws {
        
        let app = XCUIApplication()
        app.launch()
     
        let addButton =  app.navigationBars["SwiftTesting.View"].buttons["Add"]
          
          let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
          let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Item"]/*[[".cells.textFields[\"Enter Item\"]",".textFields[\"Enter Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
          let okButton = elementsQuery.buttons["OK"]
         let addedCell = app.tables.cells.containing(.staticText, identifier:"my To Do").element
        let tablesQuery = app.tables
        let deleteButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
          addButton.tap()
          textField.tap()
          textField.typeText("my To Do")
          okButton.tap()
        
        addedCell.swipeLeft()
        
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
        
    }
    
    
    
    

}
