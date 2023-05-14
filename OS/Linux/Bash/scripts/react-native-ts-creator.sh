read -p "Project name: " project_name
project=`echo "${project_name}" | awk '{print$1}'| awk '{print tolower($0)}'` 

npx react-native init $project && cd $project

npx npm install -D typescript @types/jest @types/react @types/react-native @types/react-test-renderer

cat <<EOF > tsconfig.json
{
  "compilerOptions": {
    "allowJs": true,
    "allowSyntheticDefaultImports": true,
    "esModuleInterop": true,
    "isolatedModules": true,
    "jsx": "react",
    "lib": ["es6"],
    "moduleResolution": "node",
    "noEmit": true,
    "strict": true,
    "target": "esnext"
  },
  "exclude": [
    "node_modules",
    "babel.config.js",
    "metro.config.js",
    "jest.config.js"
  ]
}
EOF

cat <<EOF > jest.config.js
module.exports = {
  preset: 'react-native',
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json', 'node']
};
EOF

mv App.js App.tsx
