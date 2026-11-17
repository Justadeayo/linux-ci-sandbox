# Useful Aliases
alias ll='ls -alF'
alias cls='clear'
alias path='echo -e ${PATH//:/\\n}'

# Quick Directory Backup Wrapper
quick_backup() {
    local target="${1:-.}"
    tar -I "zstd -T0 -3" -cf "backup_$(date +%Y%m%d_%H%M%S).tar.zst" "$target"
    echo "✅ Backup created successfully."
}
