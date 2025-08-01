/* See LICENSE file for copyright and license details. */

/* {} will be substituted with the actual argument when the rule is executed */
struct rule rules[] = {
	{ .regex = "\\.(avi|mp4|mkv|mp3|ogg|flac|mov)$", .file = "mpv", .argv = { "mpv", "{}", NULL } },
	{ .regex = "\\.(lua|c|cpp|h|py|md|latex|cfg|ini|tex|txt)$", .file = "vim", .argv = { "vim", "{}", NULL } },
	{ .regex = "\\.(bmp|png|jpg|gif|jpeg|tif|tiff)$", .file = "qimgv", .argv = { "qimgv", "{}", NULL} },
	{ .regex = "\\.(html|svg)$", .file = "firefox", .argv = { "firefox", "{}", NULL } },
	{ .regex = "\\.(pdf|ps)$", .file = "zathura", .argv = { "zathura --fork", "{}", NULL} },
	{ .regex = "\\.(kicad_pro)$", .file = "kicad", .argv = { "kicad", "{}", NULL} },
	{ .regex = "\\.(FCStd)$", .file = "freecad", .argv = { "freecad", "{}", NULL} },
	{ .regex = "\\.(dxf)$", .file = "librecad", .argv = { "librecad", "{}", NULL} },
	{ .regex = "\\.(docx|doc|xls|xlsx|odt|odf|ods)$", .file = "libreoffice", .argv = { "libreoffice", "{}", NULL} },
	{ .regex = "\\.sh$", .file = "sh", .argv = { "sh", "{}", NULL} },
	{ .regex = ".", .file = "vim", .argv = { "vim", "{}", NULL } },
};
