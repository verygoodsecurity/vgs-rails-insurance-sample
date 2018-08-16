FROM frolvlad/alpine-python3

ADD . /src
WORKDIR /src

RUN pip3 install -r requirements.txt
CMD ["python3", "-u", "server.py"]