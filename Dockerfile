FROM python:3.8
RUN apt-get update && apt-get install -y git && apt-get install -y jq
WORKDIR ./dgsm-docker
RUN git clone https://github.com/DiscordGSM/DiscordGSM.git .
RUN git checkout tags/"$(curl --silent "https://api.github.com/repos/DiscordGSM/DiscordGSM/releases/latest" | jq -r '.name')"
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python3", "bot.py", "-d"]