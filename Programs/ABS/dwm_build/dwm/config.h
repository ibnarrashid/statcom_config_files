/* ~/Programs/ABS/dwm_build/dwm/config.h */

/* appearance */
static const char font[]            = "-misc-fixed-medium-r-semicondensed-*-13-100-100-100-c-60-iso8859-1";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#005577";
static const char selbgcolor[]      = "#005577";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = False;    /* False means bottom bar */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
    /* class        instance    title       tags mask     isfloating   monitor */
    { "Chromium",   NULL,       NULL,       1 << 2,       False,       -1 },
    { "Codeblocks", NULL,       NULL,       1 << 1,       False,       -1 },
    { "Eclipse",    NULL,       NULL,       1 << 1,       False,       -1 },
    { "Evince",     NULL,       NULL,       1 << 3,       False,       -1 },
    { "Firefox",    NULL,       NULL,       1 << 2,       False,       -1 },
    { "Geany",      NULL,       NULL,       1 << 1,       False,       -1 },
    { "Nitrogen",   NULL,       NULL,       1 << 3,       False,       -1 },
    { "Pcmanfm",    NULL,       NULL,       1 << 0,       False,       -1 },
    { "Vlc",        NULL,       NULL,       1 << 3,       False,       -1 },
};

/* layout(s) */
static const float mfact      = 0.50;  /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;     /* number of clients in master area */
static const Bool resizehints = True;  /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]= |",    tile },    /* first entry is default */
    { "><> |",    NULL },    /* no layout function means floating behavior */
    { "[M] |",    monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */

static const char *dmenucmd[] = {
    "dmenu_run", "-p", "Run:", "-fn",
    font, "-nb", normbgcolor, "-nf",
    normfgcolor, "-sb", selbgcolor, "-sf",
    selfgcolor, NULL
};
static const char *termcmd[]  = {
    "urxvtc", NULL
};
static const char *editcmd[]  = {
    "urxvtc", "-e", "vim", NULL
};
static const char *mailcmd[]  = {
    "urxvtc", "-e", "mutt", NULL
};
static const char *filecmd[]  = {
    "urxvtc", "-e", "ranger", NULL
};
static const char *haltcmd[]  = {
    "systemctl", "poweroff", NULL
};
static const char *bootcmd[]  = {
    "systemctl", "reboot", NULL
};
static const char *tmuxcmd[]  = {
    "urxvtc", "-e", "tmux", NULL
};
static const char *lockcmd[]  = {
    "slock", NULL
};
static const char *soundcmd1[] = {
    "urxvtc", "-e", "alsamixer", NULL
};
static const char *soundcmd2[] = {
    "amixer", "-q", "set", "Master",
    "toggle", NULL
};
static const char *volcmd1[]  = {
    "amixer", "-q", "set", "PCM",
    "5%-", NULL
};
static const char *volcmd2[]  = {
    "amixer", "-q", "set", "PCM",
    "5%+", NULL
};
static const char *printcmd[] = {
    "scrot", NULL
};

static Key keys[] = {
    /* modifier                     key        function        argument */
    { MODKEY,                       XK_p,       spawn,          {.v = dmenucmd } },
    { MODKEY|ShiftMask,             XK_Return,  spawn,          {.v = termcmd } },
    { MODKEY|ShiftMask,             XK_e,       spawn,          {.v = editcmd } },
    { MODKEY|ShiftMask,             XK_m,       spawn,          {.v = mailcmd } },
    { MODKEY|ShiftMask,             XK_f,       spawn,          {.v = filecmd } },
    { MODKEY|ShiftMask,             XK_h,       spawn,          {.v = haltcmd } },
    { MODKEY|ShiftMask,             XK_r,       spawn,          {.v = bootcmd } },
    { MODKEY|ShiftMask,             XK_t,       spawn,          {.v = tmuxcmd } },
    { MODKEY|ShiftMask,             XK_l,       spawn,          {.v = lockcmd } },
    { MODKEY|ShiftMask,             XK_a,       spawn,          {.v = soundcmd1 } },
    { 0,                            0x1008ff12, spawn,          {.v = soundcmd2 } },
    { 0,                            0x1008ff11, spawn,          {.v = volcmd1 } },
    { 0,                            0x1008ff13, spawn,          {.v = volcmd2 } },
    { 0,                            0xff61,     spawn,          {.v = printcmd } },
    { MODKEY,                       XK_b,       togglebar,      {0} },
    { MODKEY,                       XK_j,       focusstack,     {.i = +1 } },
    { MODKEY,                       XK_k,       focusstack,     {.i = -1 } },
    { MODKEY,                       XK_i,       incnmaster,     {.i = +1 } },
    { MODKEY,                       XK_d,       incnmaster,     {.i = -1 } },
    { MODKEY,                       XK_h,       setmfact,       {.f = -0.05} },
    { MODKEY,                       XK_l,       setmfact,       {.f = +0.05} },
    { MODKEY,                       XK_Return,  zoom,           {0} },
    { MODKEY,                       XK_Tab,     view,           {0} },
    { MODKEY|ShiftMask,             XK_c,       killclient,     {0} },
    { MODKEY,                       XK_t,       setlayout,      {.v = &layouts[0]} },
    { MODKEY,                       XK_f,       setlayout,      {.v = &layouts[1]} },
    { MODKEY,                       XK_m,       setlayout,      {.v = &layouts[2]} },
    { MODKEY,                       XK_space,   setlayout,      {0} },
    { MODKEY|ShiftMask,             XK_space,   togglefloating, {0} },
    { MODKEY,                       XK_0,       view,           {.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_0,       tag,            {.ui = ~0 } },
    { MODKEY,                       XK_comma,   focusmon,       {.i = -1 } },
    { MODKEY,                       XK_period,  focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,             XK_comma,   tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,             XK_period,  tagmon,         {.i = +1 } },
    TAGKEYS(                        XK_1,                       0)
    TAGKEYS(                        XK_2,                       1)
    TAGKEYS(                        XK_3,                       2)
    TAGKEYS(                        XK_4,                       3)
    TAGKEYS(                        XK_5,                       4)
    TAGKEYS(                        XK_6,                       5)
    TAGKEYS(                        XK_7,                       6)
    TAGKEYS(                        XK_8,                       7)
    TAGKEYS(                        XK_9,                       8)
    { MODKEY|ShiftMask,             XK_q,       quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
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

/* EOF. */
