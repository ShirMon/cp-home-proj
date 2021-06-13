from django.shortcuts import render
from .models import Person
from rest_framework import generics
from .serializers import PersonSerializer


class PersonCreate(generics.CreateAPIView):
    queryset = Person.objects.all(),
    serializer_class = PersonSerializer

class PersonList(generics.ListAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer

class PersonDetail(generics.RetrieveAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer

class PersonUpdate(generics.RetrieveUpdateAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer

class PersonDelete(generics.RetrieveDestroyAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer