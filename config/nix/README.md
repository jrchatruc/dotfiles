# Instructions

```
xcode-select --install
```

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
```

```
mkdir -p ~/.config/nix-darwin
cd ~/.config/nix-darwin
```

```
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/$USER/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)
```

```
nix flake init -t nix-darwin
sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix
nix run nix-darwin -- switch --flake .
darwin-rebuild switch --flake .
```

# Useful Links

- https://blog.6nok.org/how-i-use-nix-on-macos/
- https://www.youtube.com/watch?v=Z8BL8mdzWHI
