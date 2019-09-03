FROM ubuntu

RUN apt-get update \
    && apt-get install -y ansible 
RUN mkdir /elk
WORKDIR /elk
ADD ./playbook.yml /elk/playbook.yml
EXPOSE 5601
EXPOSE 9200
ADD ./roles /elk/roles
ADD ./elk.py /elk/elk.py
RUN chmod +x elk.py
RUN /usr/bin/python elk.py
