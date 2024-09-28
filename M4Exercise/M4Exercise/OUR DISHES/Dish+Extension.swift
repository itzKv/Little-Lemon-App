import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for menuItem in menuItems {
            guard let _ = dishExist(name: menuItem.title, context) else {
                continue
            }
            let newDish = Dish(context: context)
            newDish.name = menuItem.title
            if let price = Float(menuItem.price) {
                newDish.price = price
            }
        }
        // Save
        do {
            try context.save()
        } catch (let error) {
            print("Failed to save context \(error)")
        }
    }
    
    static func dishExist(name: String, _ context: NSManagedObjectContext) -> Bool? {
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@" , name)
        fetchRequest.predicate = predicate
        
        do {
            guard let results = try context.fetch(fetchRequest) as? [Dish]
            else {
                return nil
            }
            return results.count > 0
        } catch(let error) {
            print("Failed to fetch Dish")
            return false
        }
    }
    
}
