FROM alpine:3.14

ARG FTP_USER
ARG FTP_PASS

RUN apk add vsftpd

COPY vsftpd.conf /etc/vsftpd/

RUN adduser $FTP_USER -D
RUN echo "$FTP_USER:$FTP_PASS" | chpasswd

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
