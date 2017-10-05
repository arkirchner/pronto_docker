# airbnb-base for ES6
(
  export PKG=eslint-config-airbnb-es5;
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install --global "$PKG@latest"
)
npm install -g eslint-plugin-react babel-eslint

# airbnb-base for ES6
(
  export PKG=eslint-config-airbnb-base;
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install --global "$PKG@latest"
)
