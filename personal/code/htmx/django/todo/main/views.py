from django.shortcuts import HttpResponse, render

# Create your views here.
def index(request):
    return HttpResponse("You are at the index of a todo app")
