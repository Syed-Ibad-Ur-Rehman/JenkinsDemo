pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git 'https://github.com/Syed-Ibad-Ur-Rehman/JenkinsDemo.git'
            }
        }

        stage('Build') {
            steps {
                // Run your build commands here
                
                echo 'Building the project...'
                // Example: sh 'mvn clean install'
            }
        }
                stage('Test') {
            steps {
                // Run your test commands here
                robot --include admin .
                echo 'Running tests...'
                // Example: sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                // Run deployment steps here
                echo 'Deploying the project...'
                // Example: sh 'deploy-script.sh'
            }
        }

        }

        stage('Publish Build Results') {
            steps {
                // Use YABP to publish the build graph after all stages are executed
                script {
                    // The plugin can track the build results (success/failure) over time.
                    // Ensure you have configured the plugin's settings in Jenkins for it to show the graph
                    // In Jenkins, this happens automatically, but the plugin reads build status
                    // and makes it available as a graph in the job's page.

                    // No extra steps are needed in the pipeline, as the plugin will
                    // automatically display the graph in the Jenkins interface.
                    echo 'Displaying build history graph using Yet Another Build Plugin.'
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }

        success {
            echo 'Build was successful!'
        }

        failure {
            echo 'Build failed!'
        }
    }
}
