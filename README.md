# TopQuestionsApp

### Author: Ricardo Montesinos Fernandez



 #if DEBUG
            self.apiClient.loadJsonData(file: "question-detail")
        #else
            self.fetchQuestionDetail(from: id)
        #endif