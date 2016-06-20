FROM centos:7

RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash - && \
    yum -y install nodejs && \
    npm install -g newman && \
    yum install -y centos-release-scl && \
    yum install -y rh-ruby22 rh-ruby22-rubygem-bundler rh-ruby22-ruby-devel && \
    echo "source /opt/rh/rh-ruby22/enable" > /etc/profile.d/ruby22.sh && \
    echo "export PATH=\$PATH:/opt/rh/rh-ruby22/root/usr/local/bin" >> /etc/profile.d/ruby22.sh && \
    source /etc/profile.d/ruby22.sh && \
    mkdir -p ~/.phantomjs/2.1.1/x86_64-linux && \
    curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xvfj phantomjs-2.1.1-linux-x86_64.tar.bz2 -C ~/.phantomjs/2.1.1/x86_64 && \
    yum groupinstall -y "Development Tools" && \
    yum install -y zlib-devel && \
    yum install -y zlib-devel freetype fontconfig && \
    yum clean all

