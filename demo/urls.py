from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("view/<str:orientation>/<str:output_type>", views.view, name="index"),
]