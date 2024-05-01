(function ($) {
    'use strict';
    var clickPosition = {},
        options = [];

    /**
     * Default options
     */
    var defaultOptions = {
        contextMenu: null,
        contextMenuContent: '',
        defaultStyle: 'jqcontext-menu'
    };

    /**
     * Create context menu from already builded source
     * @param {string} id 
     */
    function createConextMenu(id) {
        removeContextMenu();

        $('<div id="jqcontext-menu" class="' + options[id].defaultStyle + '">' + options[id].contextMenuContent + '</div>').css({
            position: 'absolute',
            left: clickPosition.x,
            top: clickPosition.y,
            zIndex: 1001
        }).appendTo('#'+ id);
    }

    /**
     * Clear opened context menu
     */
    function removeContextMenu() {
        $('#jqcontext-menu').remove();
    }

    /**
     * Context menu builder
     * @param {*} menu 
     */
    function buildConextMenu(menu) {
        var contextMenuContent = '';

        if (menu && menu.length) {
            contextMenuContent += '<ul>';

            $.each(menu, function (key, value) {
                contextMenuContent += '<li data-key="' + value.dataKey + '"><i class="' + value.icon + '"></i> <span>' + value.text + '</span></li>';

                if (value.subMenu && value.subMenu.length) {
                    contextMenuContent += builMenu(value.subMenu);
                }
            });

            contextMenuContent += '</ul>';
        }

        return contextMenuContent + '';
    }

    /**
     * Build menu items
     * @param {*} menu 
     */
    function builMenu(menu) {
        var contextMenuContent = '<ul>';

        $.each(menu, function (key, value) {
            contextMenuContent += '<li data-key="' + value.dataKey + '"><i class="' + value.icon + '"> ' + value.text + '</i></li>';
        });

        contextMenuContent += '</ul>';

        return contextMenuContent;
    }

    $(document).on('mousedown', function (e) {
        if (e.which === 1) {
            removeContextMenu();
        }
    });

    /**
     * Context menu initializer
     */
    $.fn.jqContextMenu = function (customOptions) {
        var _this = $(this),
            id = _this.attr('id');

        options[id] = $.extend(true, {}, defaultOptions, customOptions);
        options[id].contextMenuContent = buildConextMenu(customOptions.contextMenu, id, false);

        _this.bind("contextmenu", function (e) {
            e.preventDefault();
            clickPosition = {
                x: e.pageX,
                y: e.pageY
            };

            createConextMenu(id);
        });

        /*_this.bind("mousedown", function (e) {
            if (e.which === 1) {
                removeContextMenu();
            }
        });*/
    }
})(jQuery);