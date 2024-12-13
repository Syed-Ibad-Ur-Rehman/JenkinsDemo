pipeline {
    agent any

    stages {
        stage('Run All Tests') {
            parallel {
                stage('UI Tests') {
                    steps {
                        script {
                            def uiBuild = build job: 'UI', wait: true
                            echo "UI Job finished with status: ${uiBuild.result}"
                        }
                    }
                }
                stage('Microservices Tests') {
                    steps {
                        script {
                            def msBuild = build job: 'microservices', wait: true
                            echo "Microservices Job finished with status: ${msBuild.result}"
                        }
                    }
                }
            }
        }

        stage('Collect Results') {
            steps {
                echo "All tests completed in parallel."
            }
        }
    }
}
