pipeline {
    agent any 

    environment {
        ROBOT_RESULTS_DIR = 'robot-results'
    }

     parameters {
        string(name: 'ClientName', efaultValue: 'default_client_Name', trim: true)
        string(name: 'TestTags', defaultValue: 'GEP', trim: true, description: 'If you want to learn specific test case')
        booleanParam(name: 'SendEmail', defaultValue: true, description: 'Whether to send an email or not')
    }

    stages {
        stage('Run downstream suites') {
            when {
                beforeAgent true
                expression { env.JOB_BASE_NAME == 'Microservices'  }
            }
            steps {
                // script{
                //     echo "JOB_BASE_NAME: ${env.JOB_BASE_NAME}"
                //     echo "ClientName: ${params.ClientName}"
                //     echo "TestTags: ${params.TestTags}"
                // }
                  dir('downstream') {
                  deleteDir()
                }
                dir('downstream-aggregate') {
                deleteDir()
        }
            }
        }
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
                            passThreshold       : 100,
                            unstableThreshold   : 95.0,
                            otherFiles          : "**/*.png",
                    ])
                            // build job: 'Test1', wait: false
                }
            }
}
