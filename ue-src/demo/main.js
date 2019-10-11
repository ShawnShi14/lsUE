requirejs.config({
    baseUrl: "/ue/dist/js",
    paths: {
        'demo': '/ue/demo',
        'zeroclipboard': '/ue/demo/ZeroClipboard.min'
    },
    shim: {
        bootstrap: {
            exports: 'bootstrap'
        },
        zeroclipboard: {
            exports: 'zeroclipboard'
        },
        prettify: {
            exports: 'prettify'
        },
        arttemplate: {
        	deps: ['jquery'],
        	exports: 'arttemplate'
        },
        "form/artdialog": {
        	deps: ['jquery'],
        	exports: 'form/artdialog'
        },
        "loushang-framework": {
        	deps: ['jquery','datatables'],
        	exports: 'loushang-framework'
        }
    }
});

require(['jquery'], function($) {
    if(!$.support.leadingWhitespace) {
        require(['PIE', 'ui']);
    }
});