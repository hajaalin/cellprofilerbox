FROM hajaalin/cellprofiler

RUN yum install -y \
openssh-server \
xauth \
augeas \
git \
&& mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

ENV SSHD_CONFIG /files/etc/ssh/sshd_config
RUN augtool set ${SSHD_CONFIG}/UsePAM no \
&& augtool set ${SSHD_CONFIG}/X11Forwarding yes \
&& augtool set ${SSHD_CONFIG}/X11UseLocalhost no \
&& augtool set ${SSHD_CONFIG}/KerberosAuthentication no \
&& augtool set ${SSHD_CONFIG}/GSSAPIAuthentication no

RUN useradd dev
RUN echo 'dev:123'|chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"] 
