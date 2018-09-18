FROM golang:latest

RUN apt-get update -y && apt-get install openjdk-8-jre-headless wget -y && mkdir /app
ADD . /app/
WORKDIR /app
RUN wget https://s3.amazonaws.com/Minecraft.Download/versions/1.12/minecraft_server.1.12.jar && java -Xms256M -Xmx512M -jar minecraft_server.1.12.jar -o true && rm eula.txt && echo eula=true > eula.txt && chmod +x /app/runSrv.sh

CMD ["/app/runSrv.sh"]