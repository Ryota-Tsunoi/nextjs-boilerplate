TEMPLATE_FOLDER=("api","assets","components","hooks","stores","types","utils")

# check if feature name is provided
if [ -z "$1" ]; then
  echo "No feature name supplied"
  exit 1
fi

# check existing feature
if [ -d "../src/features/$1" ]; then
  echo "Feature $1 already exists"
  exit 1
fi

# Create feature folder
for f in "${TEMPLATE_FOLDER[@]}"; do
  mkdir ../src/features/$1/$f
  touch ../src/features/$1/$f/.gitkeep
done

# Create index.ts
touch ../src/features/$1/index.ts
