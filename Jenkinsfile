pipeline {
    agent any 

     parameters {
        string(name: 'ClientName', defaultValue: 'default_client_Name', trim: true)
        string(name: 'TestTags', defaultValue: '', trim: true)
        booleanParam(name: 'Send Email', defaultValue: false, description: 'Whether to send an email or not')
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
}
