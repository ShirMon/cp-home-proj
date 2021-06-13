from django.urls import include, path
from .views import PersonCreate, PersonList, PersonDetail, PersonUpdate, PersonDelete


urlpatterns = [
    path('create/', PersonCreate.as_view(), name='create-Person'),
    path('', PersonList.as_view()),
    path('<int:pk>/', PersonDetail.as_view(), name='retrieve-Person'),
    path('update/<int:pk>/', PersonUpdate.as_view(), name='update-Person'),
    path('delete/<int:pk>/', PersonDelete.as_view(), name='delete-Person'),
]