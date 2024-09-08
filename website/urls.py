from django.urls import path # type: ignore
from .import views

urlpatterns = [
    path('', views.loginPage, name='loginPage'),
    path('logout/', views.logoutPage, name='logoutPage'),
    path('blank-page', views.blankPage, name='blank_page')
]