npm install -g eslint eslint-plugin-react babel-eslint

# airbnb-base for ES5
(
  export PKG=eslint-config-airbnb-es5;
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install --global "$PKG@latest"
)

# airbnb-base for ES6
(
  export PKG=eslint-config-airbnb-base;
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install --global "$PKG@latest"
)

# aribnb for ES6
(
  export PKG=eslint-config-airbnb;
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install --global "$PKG@latest"
)
