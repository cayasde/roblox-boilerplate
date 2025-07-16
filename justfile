set shell := ["powershell", "-Command"] # Default shell

dev:
    lune run lune/dev.luau
setup:
    rokit install
    lune setup
    blink .\.blink -y
    pesde install
    