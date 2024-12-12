pipeline {
    agent any 

     parameters {
        string(name: 'ClientName', defaultValue: 'default_client_Name', trim: true)
        string(name: 'TestTags', defaultValue: '', trim: true)
        booleanParam(name: 'Send Email', defaultValue: false, description: 'Whether to send an email or not')
    }

    stages {
        stage('Run downstream suites') {
            steps {
                script{
                    echo "JOB_BASE_NAME: ${env.JOB_BASE_NAME}"
                    echo "ClientName: ${params.ClientName}"
                    echo "TestTags: ${params.TestTags}"
                }
            }
        }
    }
}
