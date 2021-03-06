module.exports = function(grunt) {
    // Project configuration.
    grunt.initConfig({

        // Various Grunt tasks...

        buildcontrol: {
            options: {
                dir: '_site',
                commit: true,
                push: true,
                message: 'Built %sourceName% from commit %sourceCommit% on branch %sourceBranch%'
            },
            pages: {
                options: {
                    remote: 'git@github.com:orestes/blog.orestes.io.git',
                    branch: 'gh-pages'
                }
            }
        }
    });

    grunt.registerTask('deploy', ['buildcontrol:pages']);

    grunt.loadNpmTasks('grunt-build-control');
};
