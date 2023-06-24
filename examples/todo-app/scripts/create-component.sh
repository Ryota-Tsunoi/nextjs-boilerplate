componentName=$1
featureName=$2

# if component name is not provided, exit
if [ -z "$1" ]; then
  echo "No component name supplied"
  exit 1
fi

# if featureName is defined, create component inside feature folder
if [ -n "$featureName" ]; then
  # if feature folder does not exist, exit
  if [ ! -d "../src/features/$featureName" ]; then
    echo "Feature $featureName does not exist"
    exit 1
  fi

  # if component folder already exists, exit
  if [ -d "../src/features/$featureName/components/$componentName" ]; then
    echo "Component $componentName already exists"
    exit 1
  fi
  npx scaffold create -t ./templates -o ../src/features/ $featureName/components/$componentName
else
  # if component folder already exists, exit
  if [ -d "../src/components/$componentName" ]; then
    echo "Component $componentName already exists"
    exit 1
  fi
  npx scaffold create -t ./templates -o ../src/ components/$componentName
fi
