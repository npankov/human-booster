const path = require('path');

module.exports = {
  entry: './src/index.ts',
  output: {
    filename: 'bundle.[contenthash].js', //contenthash est optionnel
    clean: true,
    path: path.resolve(__dirname, 'dist') //chemin absolu
  },
  mode: 'production',
  // devtool: 'inline-source-map', //ajout des fichiers de sourceMapping
  module: {
    rules: [ //Configuration compilation TS
      {
        test: /\.ts$/, 
        use: 'ts-loader',
        exclude: /node_modules/ 
      }
    ]
  },
  resolve: {
    extensions: ['.ts', '.js']
  }
};