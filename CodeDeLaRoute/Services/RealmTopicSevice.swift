//
//  RealmTopicSevice.swift
//  CodeDeLaRoute
//
//  Created by Nhung Nguyen on 22/04/2022.
//

import Foundation
import RealmSwift

protocol TopicService{
    func getAppInfo()
    func getTopics() -> [Topic]
    func getChildTopics(id: String) ->[Topic]
}

class RealmTopicService: TopicService{
    
    let realm: Realm
    var appInfo: AppInfo?
    
    init(realm: Realm){
        self.realm = realm
        getAppInfo()
    }
    
    func getAppInfo(){
        let AppInfos = realm.objects(AppInfo.self)
        self.appInfo = AppInfos[0]
        
    }
    
    func getTopics() -> [Topic]{
        let allTopic = realm.objects(Topic.self)
        var topics: [Topic] = []
        
        let results = allTopic.where{
            $0.parentId == appInfo!.id
        }
        
        results.forEach{topic in
                topics.append(topic)
        }
        return topics
    }
    
    func getChildTopics(id: String) ->[Topic]{
        let allTopic = realm.objects(Topic.self)
        var topics: [Topic] = []
        let results = allTopic.where{
            $0.parentId == id
        }
        
        let resultSorted = results.sorted(byKeyPath: "name", ascending: true)
        
        resultSorted.forEach{topic in
                topics.append(topic)
        }
        return topics
    }
}
