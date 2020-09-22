/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* volume commands */
static const char *upvol[]   = { "/usr/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%",     NULL };
static const char *downvol[] = { "/usr/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%",     NULL };
static const char *mutevol[] = { "/usr/bin/pactl", "set-sink-mute",   "@DEFAULT_SINK@", "toggle",  NULL };

/* screenshot commands */
static const char *screenshot[] = { "/usr/bin/scrot", "-e", "mv $f ~/screenshots", NULL };
static const char *screenshot_select[] = { "/usr/bin/scrot", "-e", "mv $f ~/screenshots", "--select", NULL };

/* appearance */
static const unsigned int borderpx      = 0;        /* border pixel of windows */
static const unsigned int gappx         = 40;        /* gaps between windows */
static const unsigned int snap          = 1;       /* snap pixel */
static const int showbar                = 1;        /* 0 means no bar */
static const int topbar                 = 1;        /* 0 means bottom bar */
static const char *fonts[]              = { "scientifica:size=6:style=Bold", "Symbola:style=Regular:size=6" };
static const char dmenufont[]           = "scientifica:size=6:style=Bold";
static const unsigned int baralpha      = OPAQUE;
static const unsigned int borderalpha   = OPAQUE;
static const char col_selbg[]           = "#0D0E0E";
static const char col_normbg[]          = "#0D0E0E";
static const char col_selfg[]           = "#f49d3e";
static const char col_normfg[]          = "#fff3cd";
static const char col_black[]           = "#0d0e0e";
static const char *colors[][3]          = {
	/*               fg             bg          border      */
	[SchemeNorm] = { col_normfg,    col_normbg, col_normbg  },
	[SchemeSel]  = { col_selfg,     col_normbg, col_selbg   },
};
static const unsigned int alphas[][3]   = {
	/*               fg             bg          border     */
	[SchemeNorm] = { OPAQUE,        baralpha,   borderalpha },
	[SchemeSel]  = { OPAQUE,        baralpha,   borderalpha },
};

/* tagging */
static const char *tags[] = { "st", "ff", "dc", "04", "05", "06", "07", "08", "mv" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "firefox",  NULL,       NULL,       1 << 1,       0,           -1 },
	{ "vlc",      "vlc",      NULL,       1 << 10,      0,           -1 },
	{ "discord",  NULL,       NULL,       1 << 2,       0,           -1 },
	{ NULL,       NULL,       "Farge",    0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "T",      tile },    /* first entry is default */
	{ "F",      NULL },    /* no layout function means floating behavior */
	{ "M",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
    "dmenu_run", "-i", "-m", dmenumon, "-fn", dmenufont,
    "-nb", col_normbg, "-nf", col_normfg, "-sb", col_selfg, "-sf", col_black, NULL
};
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_p,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_minus,  setgaps,        {.i = +1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = 0  } },
	{ 0,                            XK_Print,  spawn,          {.v = screenshot } },
	{ MODKEY,                       XK_Print,  spawn,          {.v = screenshot_select } },
	{ 0,                            XF86XK_AudioLowerVolume, spawn, {.v = downvol } },
	{ 0,                            XF86XK_AudioMute,        spawn, {.v = mutevol } },
	{ 0,                            XF86XK_AudioRaiseVolume, spawn, {.v = upvol   } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

