if [[ $0 == "./setup.sh*" ]]; then
    echo "must be run using ./setup.sh, may cause harm otherwise"
    exit
fi

for i in `realpath ./*`; do
    sudo ln -s $i /etc/nixos/
done

sudo ln -s /etc/nixos/hardware-configuration.nix ./
