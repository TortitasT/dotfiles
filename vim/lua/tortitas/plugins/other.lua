-- This plugin allows you to jump to a related file by typing :Other
return {
  "rgroli/other.nvim",
  config = function()
    require("other-nvim").setup({
      mappings = {
        -- Laravel
        "laravel",
        {
          pattern = "/src/(.*).php$",
          target = "/tests/Feature/%1Test.php",
          context = "test",
        },
        {
          pattern = "/tests/Feature/(.*)Test.php$",
          target = "/src/%1.php",
          context = "controller",
        },
      }
    })
  end
}
