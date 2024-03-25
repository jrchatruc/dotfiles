# Void Linux Setup

After installing Void under user `void`, run:

```bash
sudo xbps-install git
git clone https://github.com/jrchatruc/dotfiles.git
cd dotfiles
git checkout void
cd void_setup
./initial_setup.sh
sudo reboot
```

After reboot:

```bash
cd dotfiles
cd void_setup
./development_setup.sh
sudo reboot
```
