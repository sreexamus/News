/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Articles {
	public var author : String?
	public var title : String?
	public var description : String?
	public var url : String?
	public var urlToImage : String?
	public var publishedAt : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let articles_list = Articles.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Articles Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Articles]
    {
        var models:[Articles] = []
        for item in array
        {
            models.append(Articles(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let articles = Articles(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Articles Instance.
*/
	required public init?(dictionary: NSDictionary) {

		author = dictionary["author"] as? String
		title = dictionary["title"] as? String
		description = dictionary["description"] as? String
		url = dictionary["url"] as? String
		urlToImage = dictionary["urlToImage"] as? String
		publishedAt = dictionary["publishedAt"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.author, forKey: "author")
		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.description, forKey: "description")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.urlToImage, forKey: "urlToImage")
		dictionary.setValue(self.publishedAt, forKey: "publishedAt")

		return dictionary
	}

}