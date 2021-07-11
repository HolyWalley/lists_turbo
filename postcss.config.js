module.exports = {
  plugins: [
    require('postcss-import'),
      require('tailwindcss')({
          plugins: [
            require('@tailwindcss/forms')
          ]
      }),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}
