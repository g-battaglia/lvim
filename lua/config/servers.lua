--- Intelephense
require("lspconfig").intelephense.setup({
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
})

-- pylsp
require("lspconfig").pylsp.setup({
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
})

require("lspconfig").cssls.setup({
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
})
