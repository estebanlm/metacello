loading
ensureLoadedForDevelopmentUsing: mcLoader
	"for #development projects, always need latest version of package when contemplating a load"

	| ensured |
	ensured := mcLoader ensuredMap at: self name ifAbsent: [ nil ].
	self projectClass ~~ nil
		ifTrue: [  | vrsn |
			vrsn := self versionOrNil.
			(vrsn ~~ nil and: [ vrsn blessing == #development ])
				ifTrue: [ 
					ensured ~~ #latest
						ifTrue: [
							mcLoader ensureForDevelopment
								ifTrue: [  | pc |
									(pc := self projectClass) ~~ nil
										ifTrue: [ MetacelloClearStackCacheNotification signal: #(#versionConstructor)].
									self projectPackage loadUsing: mcLoader ]
								ifFalse: [ self projectPackage fetchUsing: mcLoader ].
							mcLoader ensuredMap at: self name put: #latest ].
					^self]].
	ensured == nil
		ifTrue:  [
			mcLoader ensureForDevelopment
				ifTrue: [  | pc |
					(pc := self projectClass) ~~ nil
						ifTrue: [ MetacelloClearStackCacheNotification signal: #(#versionConstructor)]. 
					self projectPackage loadUsing: mcLoader ]
				ifFalse: [ self projectPackage fetchUsing: mcLoader ].
			mcLoader ensuredMap at: self name put: #present ]