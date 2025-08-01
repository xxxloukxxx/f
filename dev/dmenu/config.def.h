/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int instant = 0;
static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;  /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
/* -fn option overrides fonts[0]; default X11 font or font set */
// static const char *fonts[] = {"IBM Plex Mono:size=12"};
// static const char *fonts[] = {"Firacode Nerd Font Mono:size=12"};
// static const char* fonts[] = { "SauceCodePro Nerd Font Mono:size=14" };
// static const char* fonts[] = { "RobotoMono Nerd Font:size=12" };
// static const char *fonts[] = {"Inconsolata:size=16"};
static const char *fonts[] = {"agave:size=14"};
//  "Liberation Mono:pixelsize=18:antialias=true:autohint=true"
static const char* prompt = NULL; /* -p  option; prompt to the left of input field */
static const char* colors[SchemeLast][2] = {
	/*     fg         bg       */
	// [SchemeNorm] = { "#BFBDB6", "#0D1017" },
	[SchemeNorm] = { "#ccc", "#000" },
	//	[SchemeNorm] = { "#bbbbbb", "#000000" },
	[SchemeSel] = { "#eeeeee", "#005577" },
	[SchemeSelHighlight] = { "#ffc978", "#005577" },
	[SchemeNormHighlight] = { "#ffc978", "#222222" },
	[SchemeOut] = { "#000000", "#00ffff" },
	[SchemeOutHighlight] = { "#ffc978", "#00ffff" },
};
// static const char *colors[SchemeLast][2] = {
//	/*     fg         bg       */
//	[SchemeNorm] = { "#bbbbbb", "#222222" },
//	[SchemeSel] = { "#eeeeee", "#005577" },
//	[SchemeSelHighlight] = { "#ffc978", "#005577" },
//	[SchemeNormHighlight] = { "#ffc978", "#222222" },
//	[SchemeOut] = { "#000000", "#00ffff" },
//	[SchemeOutHighlight] = { "#ffc978", "#00ffff" },
// };
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
