FROM webapm/google-chrome-headless-node

ARG VERSION=5.2.0

LABEL version="${VERSION}"

USER root

COPY . /home/chrome/lighthouse

RUN npm install --global /home/chrome/lighthouse && \
  mkdir -p /home/chrome/reports && chown -R chrome:chrome /home/chrome

# some place we can mount and view lighthouse reports
VOLUME /home/chrome/reports
WORKDIR /home/chrome/reports

COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod a+x /usr/bin/entrypoint

# Run Chrome non-privileged
USER root

VOLUME /home/chrome/reports

# Drop to cli
ENTRYPOINT ["/usr/bin/entrypoint"]
