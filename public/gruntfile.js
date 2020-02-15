module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
      pkg: grunt.file.readJSON('package.json'), // mon-super-projet
      sass: {
        dist: {
          options: {
            style: 'compressed', // Can be nested, compact, compressed, expanded.
            compass: false
          },
          files: { 
            'assets/css/style.min.css': 'assets/src/css/style.scss',
            'assets/css/special.min.css': 'assets/src/css/special.scss',
            'assets/css/header.min.css' : 'assets/src/css/header.scss',
            'assets/css/common.min.css' : 'assets/src/css/common.scss',
            'assets/css/index.min.css' : 'assets/src/css/index.scss',
            'assets/css/footer.min.css' : 'assets/src/css/footer.scss',
            'assets/css/legal.min.css' : 'assets/src/css/legal.scss',
          }
        }
        },
      uglify: {
        options: {
          banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
        },
        build: {
          src: ['assets/src/js/libs/*.js', 'assets/src/js/*.js'],
          dest: 'assets/js/script.min.js'
        }
      },
      imagemin: {
        dynamic: {
            files: [{
                expand: true,
                cwd: 'assets/src/images/',
                src: ['**/*.{png,jpg,gif}'],
                dest: 'assets/images/'
            }]
        }
      },
      clean: ['assets/js', 'assets/css']
    });
  
    // Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks("grunt-contrib-sass");
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-imagemin');
  
    // Default task(s).
    grunt.registerTask('default', ['clean', 'sass', 'uglify', 'imagemin']);
  
  };