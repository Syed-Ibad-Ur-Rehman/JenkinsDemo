pipeline {
    agent any

    environment {
        ROBOT_RESULTS_DIR = 'robot-results'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    echo "Checking out code from Git..."
                    git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Syed-Ibad-Ur-Rehman/JenkinsDemo.git'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    echo "Installing dependencies..."
                    bat 'pip install robotframework'
                }
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                script {
                    echo "Running Robot Framework tests..."
                    bat "robot --outputdir ${ROBOT_RESULTS_DIR} tests/"
                }
            }
        }

        stage('Display Build History') {
            steps {
                script {
                    echo 'Displaying build history using YABP.'
                }
            }
        }
    }

    post {
        always {
            script {
                echo 'Publishing Robot Framework test results...'
                robotPublish(
                    outputDir: 'robot-results',
                    outputFileName: 'output.xml',
                    logFileName: 'log.html',
                    reportFileName: 'report.html',
                    disableArchiveOutput: false,
                    passThreshold: 95.0,
                    unstableThreshold: 95.0,
                    otherFiles: '**/*.png' // This is for including additional files like screenshots, etc.
                )
            }
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
