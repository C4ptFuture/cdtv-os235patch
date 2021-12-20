FROM python:3.9-slim-bullseye


RUN apt-get update && apt-get -y install gcc git bsdiff
RUN pip3 install cython 
RUN pip3 install -U git+https://github.com/cnvogelg/amitools.git

WORKDIR /appl
ADD src/ /appl/

CMD /appl/run.sh
