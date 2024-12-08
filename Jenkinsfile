pipeline {
    agent any

    environment {
        ROBOT_RESULTS_DIR = 'robot-results'
    }

    steps {
        script {
            // Checkout the code from the Git repository
            echo "Checking out code from Git..."
            git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Syed-Ibad-Ur-Rehman/JenkinsDemo.git'
        }

        script {
            // Install required dependencies (e.g., Robot Framework, libraries)
            echo "Installing dependencies..."
            bat 'pip install robotframework'
        }

        script {
            // Run Robot Framework tests
            echo "Running Robot Framework tests..."
            bat "robot --outputdir ${ROBOT_RESULTS_DIR} tests/"
        }

        script {
            // You don't need additional steps to enable YABP. It automatically
            // displays the graph based on build results.
            echo 'Displaying build history using YABP.'
        }
    }

    post {
        always {
            // Publish Robot Framework test results using Robot Publisher
            echo 'Publishing Robot Framework test results...'
            robotPublish(
                outputDir: 'robot-results',
                outputFileName: 'output.xml',
                logFileName: 'log.html',
                reportFileName: 'report.html',
                disableArchiveOutput: false,
                passThreshold: 95.0,
                unstableThreshold: 95.0,
                otherFiles: '**/*.png'  // This is for including additional files like screenshots, etc.
            )
        }

        success {
            echo 'Build and tests completed successfully!'
            build job: 'Test1', wait: false
        }

        failure {
            echo 'Build or tests failed.'
        }
    }
}
