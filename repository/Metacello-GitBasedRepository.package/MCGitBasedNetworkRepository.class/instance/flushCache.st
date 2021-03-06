initialize-release
flushCache
  "the directory acts like a cache since we download the directory from a git-based repository (github, bitbucket, etc.)"
	| directory |

	[ localRepository flushCache ]
	on: Error
	do: [ :ex | 
		Transcript
			cr;
			show: 'Error for: ' , self description printString , ' during flushCache: ', ex description printString ].
	self class flushDownloadCache.
	
	directory := self calculateRepositoryDirectory.
	directory exists 
		ifTrue: [ localRepository directory: directory ]
		ifFalse: [ localRepository resetDirectory ]