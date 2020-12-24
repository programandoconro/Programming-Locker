# Latest Java in Arch/Manjaro:
pacman -S jdk-openjdk

# Install a specific version
pacman -S openjdk11-src

# Adjust default version
archlinux-java status
archlinux-java set java-14-openjdk

# Run Hello-world
pamac helloworld.java
java HelloWorld
