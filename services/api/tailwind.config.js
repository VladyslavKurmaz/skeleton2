module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    "./node_modules/flowbite/**/*.js",
  ],
  theme: {
    extend: {
      screens: {
        xs: '480px',
        sm: '640px',
        md: '768px',
        lg: '1024px',
        xl: '1280px',
      },
      colors: {
        primary: {
          50: '#f0fdf4',
          100: '#dcfce7',
          200: '#bbf7d0',
          300: '#86efac',
          400: '#4ade80',
          500: '#22c55e',
          600: '#16a34a',
          700: '#15803d',
          800: '#166534',
          900: '#14532d'
        },

        'midnight-blue': {
          '50': '#B5ADE2',
          '100': '#A79EDD',
          '200': '#8C7FD3',
          '300': '#7161C8',
          '400': '#5643BE',
          '500': '#4838A0',
          '600': '#3A2D82',
          '700': '#2D2363',
          '800': '#1F1845',
          '900': '#0C0A1B'
        },
        'dark-gray': {
          '50': '#F7F6F6',
          '100': '#E4E3E3',
          '200': '#C8C7C7',
          '300': '#A5A3A3',
          '400': '#827F7F',
          '500': '#676565',
          '600': '#524F50',
          '700': '#434242',
          '800': '#383737',
          '900': '#333232',
        }
      }

    },

    fontFamily: {
      'body': [
        'Barlow',
        'Inter',
        'ui-sans-serif',
        'system-ui',
        '-apple-system',
        'system-ui',
        'Segoe UI',
        'Roboto',
        'Helvetica Neue',
        'Arial',
        'Noto Sans',
        'sans-serif',
        'Apple Color Emoji',
        'Segoe UI Emoji',
        'Segoe UI Symbol',
        'Noto Color Emoji'
      ],
      'sans': [
        'Barlow',
        'Inter',
        'ui-sans-serif',
        'system-ui',
        '-apple-system',
        'system-ui',
        'Segoe UI',
        'Roboto',
        'Helvetica Neue',
        'Arial',
        'Noto Sans',
        'sans-serif',
        'Apple Color Emoji',
        'Segoe UI Emoji',
        'Segoe UI Symbol',
        'Noto Color Emoji'
      ],
      'heading': [
        'Space Mono',
        'monospace'
      ]
      
    },    
    
  },
  plugins: [
    require('flowbite/plugin'),
  ],
}
