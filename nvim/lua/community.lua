--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  -- {"github/copilot.vim"},
  { "Exafunction/codeium.vim", event = "BufEnter" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  {
    "nomnivore/ollama.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
    keys = {
      -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
      {
        "<leader>mo",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "ollama prompt",
        mode = { "n", "v" },
      },

      -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
      {
        "<leader>mG",
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = "ollama Generate Code",
        mode = { "n", "v" },
      },
    },
    opts = {
      model = "qwen2.5-coder:7b",
      url = "http://127.0.0.1:11434",
      serve = {
        on_start = false,
        command = "ollama",
        args = { "serve" },
        stop_command = "pkill",
        stop_args = { "-SIGTERM", "ollama" },
      },
      prompts = {
        Ask_About_Code = {
          prompt = "我有一个问题关于: $input\n\n 代码内容如下: \n```$ftype\n$sel```,请用中文回复",
          input_label = "Question >>> ",
        },
        Explain_Code = {
          prompt = "请用中文解释这段代码,代码内容如下: \n```$ftype\n$sel```",
        },
        Raw = {
          prompt = "请用中文回答问题: $input",
          input_label = ">",
          action = "display",
        },
        Sample_Prompt = {
          prompt = "请解释这段$ftype代码的意思, 代码内容如下 $sel",
          input_label = "> ",
        },
      },
    },
  },
}
