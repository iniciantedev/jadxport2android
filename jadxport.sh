
main() {
echo  "initial prepare"
pkg update -y
pkg upgrade -y
pkg install x11-repo -y
export DISPLAY=:0
echo "installing dependencies for x11"
pkg install termux-x11-nightly xterm openbox -y
echo "installing jadx and dependencies"
pkg install jadx jadx-x
termux-x11 :0
openbox-session &
jadx-gui &
}

main
