tests
testFileTreeLoadBaseline1
    Metacello new
        baseline: 'ExternalX';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    self
        validate: 'ExternalX'
        registrySize: 1
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'filetree://' , externalDirectory fullName