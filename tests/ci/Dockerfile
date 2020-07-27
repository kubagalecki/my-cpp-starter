COPY $GITHUB_WORKSPACE CI/

RUN ls -l
RUN ls -l CI/
RUN chmod +x CI/tests/ci/entrypoint.sh

ENTRYPOINT ["sh", "CI/tests/ci/entrypoint.sh"]
