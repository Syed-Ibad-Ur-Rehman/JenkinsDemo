node {
    try {
        // Checkout the code from Git repository
        echo "Checking out the code from Git..."
        git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Syed-Ibad-Ur-Rehman/JenkinsDemo.git'

        // Install Dependencies
        echo "Installing dependencies..."
        bat 'pip install robotframework'

        // Run Robot Framework Tests
        echo "Running Robot Framework tests..."
        bat "robot --outputdir robot-results tests/"

        // Publish Robot Framework Results
        echo "Publishing test results..."
            $class: 'RobotPublisher',
            outputDir: 'robot-results',
            outputFileName: 'output.xml',
            logFileName: 'log.html',
            reportFileName: 'report.html',
            disableArchiveOutput: false,
            passThreshold: 95.0,
            unstableThreshold: 95.0,
            otherFiles: '**/*.png'
 
        build job: 'Test1', wait: false  
        
    } catch (Exception e) {
        currentBuild.result = 'FAILURE'
        throw e
    } finally {
        echo "Cleaning up..."
    }
}
