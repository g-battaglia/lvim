-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- To debug ad the start of vim:
-- print("opts", vim.inspect(opts.sections.lualine_x))

-- FIXME --
--- Intelephense
require("lspconfig").intelephense.setup({
  settings = {
    intelephense = {
      format = {
        braces = "k&r",
      },
      stubs = {
        "apache",
        "bcmath",
        "bz2",
        "calendar",
        "com_dotnet",
        "Core",
        "ctype",
        "curl",
        "date",
        "dba",
        "dom",
        "enchant",
        "exif",
        "FFI",
        "fileinfo",
        "filter",
        "fpm",
        "ftp",
        "gd",
        "gettext",
        "gmp",
        "hash",
        "iconv",
        "imap",
        "intl",
        "json",
        "ldap",
        "libxml",
        "mbstring",
        "meta",
        "mysqli",
        "oci8",
        "odbc",
        "openssl",
        "pcntl",
        "pcre",
        "PDO",
        "pdo_ibm",
        "pdo_mysql",
        "pdo_pgsql",
        "pdo_sqlite",
        "pgsql",
        "Phar",
        "posix",
        "pspell",
        "readline",
        "Reflection",
        "session",
        "shmop",
        "SimpleXML",
        "snmp",
        "soap",
        "sockets",
        "sodium",
        "SPL",
        "sqlite3",
        "standard",
        "superglobals",
        "sysvmsg",
        "sysvsem",
        "sysvshm",
        "tidy",
        "tokenizer",
        "xml",
        "xmlreader",
        "xmlrpc",
        "xmlwriter",
        "xsl",
        "Zend OPcache",
        "zip",
        "zlib",
        "wordpress",
      },
    },
  },
})

-- pylsp
require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        flake8 = { enabled = false },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        yapf = { enabled = false },
        isort = { enabled = false },
        autopep8 = { enabled = false },
        pyright = { enabled = true },
        mccabe = { enabled = false },
        -- Enabled
        pylsp_mypy = { enabled = true },
        black = { enabled = true },
      },
    },
  },
})

require("tokyonight").setup({
  -- use the night style
  style = "storm",
  vim.cmd("hi BufferLineFill guibg='#1e2030'"),
})


-- CMD Line height 0:
-- vim.opt.cmdheight = 0

-- Disable relative line number:
vim.opt.relativenumber = false
