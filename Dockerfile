FROM centos:latest

# who's your boss?
MAINTAINER "Tamas Foldi" <tfoldi@starschema.net>

ADD https://downloads.tableau.com/tssoftware/extractapi-linux-x86_64-2019-2-2.tar.gz /tmp

RUN mkdir /hyper && \
	tar xvzf /tmp/extractapi-linux-x86_64-2019-2-2.tar.gz --strip 1 -C /hyper && \
	/hyper/bin/hyper/hyperd configure --log-dir /hyper/ -d /hyper/hyper.hyper --no-password --no-ssl --init-user tableau_internal_user

EXPOSE 7483

CMD /hyper/bin/hyper/hyperd start --log-dir /hyper/ -d /hyper/hyper.hyper --skip-license --no-password --no-ssl --listen-connection tab.tcp://0.0.0.0:7483 ; sleep 1; ps auxw ; cat /hyper/hyperd.log


