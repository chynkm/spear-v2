$(function() {
    APP.portNewEdit.init();
});

var APP = APP || {};

APP.portNewEdit = {
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