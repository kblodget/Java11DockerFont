FROM adoptopenjdk/openjdk11:alpine as builder
WORKDIR /workspace/app

COPY FontTest.java .

RUN javac FontTest.java

FROM adoptopenjdk/openjdk11:jre-11.0.11_9-alpine
RUN apk add --no-cache fontconfig ttf-dejavu

COPY --from=builder /workspace/app/FontTest.class .

ENTRYPOINT ["java","FontTest"]

