private
resolveToAllPackagesIn: aVersionSpec visited: visited
	| vrsn |
	visited
		pushProject: [ 
			visited
				visit: self
				doing: [ :spec | 
					spec ensureProjectLoaded.
					(vrsn := spec versionOrNil) == nil
						ifTrue: [ (MetacelloVersionDoesNotExistError project: self project versionString: self versionString) signal ].
					^ vrsn allPackagesForSpecNamed: (self loadListForVersion: vrsn) ifAbsent: [ self error: 'invalid loads: spec' ] ] ].
	^ #()