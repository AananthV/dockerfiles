# Install jdk
apk add openjdk11

# Install coc-java
nvim --headless +"CocInstall coc-java -sync" +qall

# Install jdt.ls
mkdir -p /root/.config/coc/extensions/coc-java-data/server
curl http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz | tar -xz -C /root/.config/coc/extensions/coc-java-data/server
