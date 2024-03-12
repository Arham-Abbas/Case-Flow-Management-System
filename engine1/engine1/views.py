from django.views import View
from django.http import HttpResponse
from django.core.files.storage import default_storage

from datetime import datetime
from docquery import document
from docquery import pipeline

class Engine1(View):
    def extract(self, path, filename):
        pipe = pipeline('document-question-answering')
        doc = document.load_document(path + filename)
        questions = list()
        data = dict()
        for i in questions:
            data[i] = pipe(question = i, **doc.context)
        return data

    def post(self, request):
        if 'data' in request.FILES.keys():
            return HttpResponse('Data received and saved successfully')
        else:
            key = list(request.FILES.keys())[0]
            file = request.FILES[key]
            filename = datetime.now().strftime('%d%m%y%H%M%S') + key
            path = '../../.cache/'
            filename = default_storage.save(path + filename, file)
            data = self.extract(path, filename)
            db = db1(data)
            db.save()
            return HttpResponse('Document received and saved successfully')
