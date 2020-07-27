COPY ./ ./

RUN chmod +x tests/ci/entrypoint.sh

ENTRYPOINT ["sh", "tests/ci/entrypoint.sh"]
