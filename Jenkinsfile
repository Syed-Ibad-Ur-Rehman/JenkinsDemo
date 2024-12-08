pipeline {
    agent any

    environment {
        ROBOT_RESULTS_DIR = 'robot-results'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git branch: 'main' , changelog: false, poll: false, url: 'https://github.com/Syed-Ibad-Ur-Rehman/JenkinsDemo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Install required dependencies (e.g., Robot Framework, libraries)
                    bat  'pip install robotframework'
                }
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                script {
                    // Run Robot Framework tests
                    echo "Running Robot Framework tests..."
                    // bat   'robot --include admin .' 
                    bat  "robot --outputdir ${ROBOT_RESULTS_DIR} tests/"
                }
            }
        }

        stage('Display Build History') {
            steps {
                script {
                    // You don't need additional steps to enable YABP. It automatically
                    // displays the graph based on build results.
                    echo 'Displaying build history using YABP.'
                }
            }
        }
    }

            post {
                always {
                    step([
                            $class              : 'RobotPublisher',
                            outputPath          : 'robot-results',
                            outputFileName      : "output.xml",
                            reportFileName      : 'report.html',
                            logFileName         : 'log.html',
                            disableArchiveOutput: false,
                            passThreshold       : 95.0,
                            unstableThreshold   : 95.0,
                            otherFiles          : "**/*.png",
                    ])
                            build job: 'Test1', wait: false
                }
            }
}
