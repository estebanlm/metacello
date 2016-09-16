private
createPackage: packageName packageVersion: packageVersion in: aRepository withDefinitions: definitionArray

  | classDefinitions classMap |
  classDefinitions := OrderedCollection new.
  classMap := Dictionary new.
  definitionArray do: [:def |
    def 
      classDefinition: [:classDefinition | classDefinitions add: classDefinition ]
      methodDefinition: [ :methodDefinition | 
          (classMap at: methodDefinition className ifAbsentPut: [ Set new ])
            add: methodDefinition ] ].
  package := CypressPackageStructure new.
  package named: packageName, package packageExtension from: classDefinitions classMap: classMap.