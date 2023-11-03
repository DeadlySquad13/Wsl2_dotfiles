# Buku.
alias b='buku --suggest';

# Goto.
alias g='goto';

# Temporary workarounds caused by stubborn monorepo structure.
alias lint_shepherd="yarn --cwd ../ run lint:es --scope @monorepo/shepherd --"
alias test_shepherd="yarn --cwd ../ run test --scope @monorepo/shepherd --"
