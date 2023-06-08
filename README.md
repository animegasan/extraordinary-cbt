---

<h1 align="center">Extraordinary CBT</h1>
<h3 align="center">The Free Software For Exam Management</h3>

---

<p align="center">
<img alt="Logo Banner" src="https://iili.io/H4hm8Hx.png"/>
</p>

---

Extraordinary CBT is a web-based application for exam management that can be run online or locally, hosting or VPS.

The image build on <a href="http://www.alpinelinux.org" target="_blank">Alpine Linux</a> and Extraordinary CBT from <a href="https://github.com/shellrean-dev/exo-cbt-client" target="_blank">Shellrean</a>.

---

## Supported Architectures
We utilise the docker manifest for multi-platform awareness. Simply pulling ```animegasan/extraordinary-cbt:latest``` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ✅ | arm64-\<version tag\> |
| armhf	| ✅	| arm32v7-\<version tag\> |

---

## Usage
Here are some example snippets to help you get started creating a container.
### docker-compose (recommended)
```yaml
---
version: "2.1"
services:
  extraordinary-cbt:
    image: animegasan/extraordinary-cbt:latest
    container_name: extraordinary-cbt
    ports:
      - 8080:80
    environment:
      MYSQL_DATABASE: database
      MYSQL_USER: user
      MYSQL_PASSWORD: password
      MYSQL_ROOT_PASSWORD: password
    restart: unless-stopped
```
### docker cli

```bash
docker run -d \
  --name=extraordinary-cbt \
  -p 8080:80 \
  -e MYSQL_DATABASE=database \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=password \
  -e MYSQL_ROOT_PASSWORD=password \
  --restart unless-stopped \
  animegasan/extraordinary-cbt:latest
```

---

### Web Interface

Visit the url `http://<IP_ADDRESS>:8080` to have access to the Extraordinary CBT's web interface.

And visit the url `http://<IP_ADDRESS>:8080/admin-system` to have access to the Extraordinary CBT's web settings.

-   Default username: `admin@shellrean.com`
-   Default password: `criticalpassword`

**It's highly recommended to change the default access credentials on first start**.

---

## Packages
The package used by this image are:
- nginx
- php7
- php7-fpm
- php7-dom
- php7-xml
- php7-xmlwriter
- php7-xmlreader
- php7-simplexml
- php7-tokenizer
- php7-mysqli
- php7-openssl
- php7-json
- php7-curl
- php7-mbstring
- php7-zip
- php7-fileinfo
- php7-gd
- php7-pdo
- php7-pdo_mysql
- php7-session
- php7-ctype
- mysql
- mysql-client
- supervisor
- wget

---

## Version
### 3.16.3
#### Feature
   - School setting
   - Major
   - Participant
   - Subjects
   - User
   - Bank question
   - Exams event
   - Exams schedule
   - Media files
   - Exams status
   - Examinee status
   - Correction Essay
   - Reporting menu - student achievement
   - Reportage menu - problem difficulty
   - Exam results
   - Session settings can be made in the exam event
   - Token usage settings (on/off)
   - Multiple exams

#### Question type
   - Multiple choice
   - Complex multiple choice
   - Listening
   - Matchmaking
   - Short entry
   - Description

---

## Credit
[Shellrean](https://github.com/shellrean), [Hilman Maulana](https://github.com/animegasan).

---
