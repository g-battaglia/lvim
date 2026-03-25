return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        -- PHP (WordPress/WooCommerce)
        intelephense = {
          settings = {
            intelephense = {
              format = {
                braces = "k&r",
              },
              stubs = {
                "Core",
                "FFI",
                "PDO",
                "Phar",
                "Reflection",
                "SPL",
                "SimpleXML",
                "Zend OPcache",
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
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
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "posix",
                "pspell",
                "readline",
                "random",
                "session",
                "shmop",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "wordpress",
                "wordpress-stubs",
                "woocommerce-stubs",
                "acf-pro-stubs",
                "wordpress-globals",
                "wp-cli-stubs",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "zip",
                "zlib",
              },
            },
          },
        },

        -- Python
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                -- Disabled
                autopep8 = { enabled = false },
                flake8 = { enabled = false },
                isort = { enabled = false },
                mccabe = { enabled = false },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
                pyright = { enabled = true },
                yapf = { enabled = false },
                -- Enabled
                black = { enabled = true },
                pylsp_mypy = { enabled = true },
              },
            },
          },
        },

        -- CSS/SCSS/Less
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = { unknownAtRules = "ignore" },
            },
            scss = {
              validate = true,
              lint = { unknownAtRules = "ignore" },
            },
            less = {
              validate = true,
              lint = { unknownAtRules = "ignore" },
            },
          },
        },

        -- Vue 3 (inlay hints removed -- globally disabled)
        volar = {
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
        },

        -- TypeScript/JavaScript (inlay hints removed -- globally disabled)
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath("data")
                  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
              },
            },
          },
          settings = {
            typescript = {
              tsserver = {
                useSyntaxServer = false,
              },
            },
          },
        },
      },
    },
  },
}
