$(function() {
    APP.serverNewEdit.init();
});

var APP = APP || {};

APP.serverNewEdit = {
    init: function () {
        this.ionRangeSlider();
    },

    ionRangeSlider: function() {
        $('#probe_interval').ionRangeSlider({
            min: 1,
            max: 60,
            grid: true,
            prefix: 'Every ',
            postfix: ' mins',
            from: 1,
        });
    },

};