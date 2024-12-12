

def globalagent = any
def default_client_Name = 'https://opensource-demo.orangehrmlive.com '

pipeline{
    agent  any    

    parameters{
        string name: 'ClientName',
        defaultValue: default_client_Name,
        trim: true

        string name: 'TestTags',
        defaultValue: null,
        trim: true

        booleanParam name: 'Send Email'
        defaultValue: false
    }
    stages {
        stage('Run downstream suites') {
            when {
                beforeAgent true
                expression {env.JOB_BASE_NAME == 'All_Suites' || env.JOB_BASE_NAME == 'All_Test'}
            }
               steps {
                    dir('downstream') {
                    deleteDir()
                }
                    dir('downstream-aggregate') {
                    deleteDir()
                }
        }

    }
}
}
