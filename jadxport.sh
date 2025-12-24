
main() {
termux-setup-storage
echo  "initial prepare"
pkg update -y
pkg upgrade -y
pkg install x11-repo -y
echo "installing dependencies for x11"
pkg install termux-x11-nightly xterm openbox -y
echo "installing jadx and dependencies"
pkg install jadx jadx-x -y
cat << EOF > $PREFIX/bin/startjadx
#!/data/data/com.termux/files/usr/bin/sh
export DISPLAY=:0
export JAVA_HOME=/data/data/com.termux/files/usr/lib/jvm/java-21-openjdk
termux-x11 :0 &
openbox-session &
jadx-gui &
EOF
chmod +x $PREFIX/bin/startjadx
cat << EOF > $PREFIX/bin/stopjadx
#!/data/data/com.termux/files/usr/bin/sh
pkill -f 'jadx.gui.JadxGUI'
pkill -f '^openbox-session$'
pkill -f 'com.termux.x11.Loader :0'
EOF
chmod +x $PREFIX/bin/stopjadx
}

main
