COPY ./ ci/

RUN ls -al ci/
RUN chmod +x ci/tests/ci/entrypoint.sh

ENTRYPOINT ["sh", "ci/tests/ci/entrypoint.sh"]
