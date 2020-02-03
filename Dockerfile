FROM openjdk:8

ENV PAPER_URL=https://papermc.io/api/v1/paper/1.15.2/latest/download
ENV MEMORY_SIZE=1G

EXPOSE 25565/tcp
EXPOSE 25565/udp

WORKDIR /opt/minecraft
ADD ${PAPER_URL} paper.jar

RUN useradd -M minecraft && chown minecraft /opt/minecraft -R
USER minecraft

WORKDIR /data

ENTRYPOINT /usr/local/openjdk-8/bin/java -jar -Xms$MEMORY_SIZE -Xmx$MEMORY_SIZE -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs -Dcom.mojang.eula.agree=true /opt/minecraft/paper.jar
# CMD ["java", "-jar", "/opt/minecraft/paper.jar"]