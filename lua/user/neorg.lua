require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          work = "~/notes/work",
          home = "~/notes/home",
        },
        default_workspace = "home",
      }
    },
    ["core.concealer"] = {
      config = {
        icons = {
          heading = {
            enabled = true,

            level_1 = {
              enabled = true,
              icon = "◉",
            },
            level_2 = {
              enabled = true,
              icon = " ○",
            },
            level_3 = {
              enabled = true,
              icon = "  ●",
            },
            level_4 = {
              enabled = true,
              icon = "   ○",
            },
          },
        },
      }
    } }
}
