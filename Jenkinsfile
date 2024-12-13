pipeline {
    agent any

    parameters {
        string(name: 'DOWNSTREAM_JOB', defaultValue: 'MyDownstreamJob', description: 'Name of the downstream job to trigger')
        string(name: 'DOWNSTREAM_PARAM', defaultValue: 'value1', description: 'Parameter for the downstream job')
    }

    stages {
        stage('Trigger Downstream Job') {
            steps {
                script {
                    // Trigger the downstream job with parameters
                    def downstreamBuild = build job: params.DOWNSTREAM_JOB,
                        parameters: [
                            string(name: 'PARAM1', value: params.DOWNSTREAM_PARAM)
                        ],
                        wait: true // Wait for the downstream job to complete
                        
                    // Print the result of the downstream job
                    echo "Downstream job result: ${downstreamBuild.result}"
                }
            }
        }
    }
}
