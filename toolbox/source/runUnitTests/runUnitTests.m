function testResults = runUnitTests()

projObj = currentProject;

testResults = runtests(..., 
                'BaseFolder', fullfile(projObj.RootFolder, "tests"));