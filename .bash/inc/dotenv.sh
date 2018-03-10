dotenv() {
    FILE="${1:-.env}"
    echo "Sourcing $FILE"
    config=$(sed 's/^#.*//' $FILE | sed 's/\([^=]*\)=\(.*\)/export \1="\2"/')
    eval $config
}