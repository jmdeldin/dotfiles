/**
 * Name:   resize.js
 * Author: Jon-Michael Deldin <dev@jmdeldin.com>
 *
 * Commands:
 *   :r[esize] <width> [<height>]
 *                   - if not specified, defaults to current height
 */
function resize(w, h) {
    h = h || window.outerHeight;
    window.resizeTo(w, h);
};

commands.addUserCommand(['r[esize]'], 'Resize current window',
                        function(args){ resize(args[0], args[1]); });

