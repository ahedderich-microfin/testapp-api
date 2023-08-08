from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

from utils.gotenberg import generate_pdf


# Create your views here.
def index(request):
    return HttpResponse("Hello, world.")


def view(request, orientation, output_type):
    template = loader.get_template("demo/table.html")
    content = template.render({ "range": range(100) }, request)
    content_type = "text/html"
    if output_type == "pdf":
        content_type = "application/pdf"
        landscape = False
        if orientation == "landscape":
            landscape = True
        content = generate_pdf(content, landscape=landscape)
    print("asd", content)
    
    return HttpResponse(content, content_type=content_type)