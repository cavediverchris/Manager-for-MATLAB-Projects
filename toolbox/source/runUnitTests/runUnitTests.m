function testResults = runUnitTests()

projObj = currentProject;

testResults = runtests(projObj.RootFolder,'IncludeSubfolders',true);