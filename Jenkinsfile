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

        // stage('Install Dependencies') {
        //     steps {
        //         script {
        //             // Install required dependencies (e.g., Robot Framework, libraries)
        //             sh 'pip install robotframework'
        //         }
        //     }
        // }

        stage('Run Robot Framework Tests') {
            steps {
                script {
                    // Run Robot Framework tests
                    echo "Running Robot Framework tests..."
                    // sh  'robot --include admin .' 
                    // sh "robot --outputdir ${ROBOT_RESULTS_DIR} tests/"
                }
            }
        }

        stage('Publish Robot Framework Results') {
            steps {
                script {
                    // Publish Robot Framework results using the Robot Framework plugin
                    robotPublish(
                        outputDir: "${ROBOT_RESULTS_DIR}",
                        outputFileName: 'output.xml',
                        logFileName: 'log.html',
                        reportFileName: 'report.html'
                    )
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
            echo 'Cleaning up...'
        }

        success {
            echo 'Build and tests completed successfully!'
        }

        failure {
            echo 'Build or tests failed.'
        }
    }
}
