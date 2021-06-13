FROM django:1

WORKDIR /software

RUN pip install --upgrade django djangorestframework

EXPOSE 8000

ENTRYPOINT [ "python3" ]
CMD [ "/software/manage.py", "runserver", "0.0.0.0:8000" ]

COPY . .