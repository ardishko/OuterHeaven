{
    config,
    inputs,
    lib,
    pkgs,
    ...
}:
imports = [inputs.nixvim.homeManagerModules.nixvim];

            programs.nixvim = {
                enable = true;
                defaultEditor = true;
                package = pkgs.neovim-nightly;
                enableMan = true;
                colorscheme = "catppuccin";
                colorschemes.catppuccin = {
                    enable = true;
                    flavour = "mocha";
                    transparentBackground = true;
                };

                options = {
                    number = true;
                    relativenumber = true;
                    autoread = true;
                    so = 7;
                    cmdheight = 1;
                    ignorecase = true;
                    smartcase = true;
                    showmatch = true;
                    timeoutlen = 500;
                    encoding = "utf8";
                    smarttab = true;
                    shiftwidth = 4;
                    tabstop = 4;
                    expandtab = true;
                    linebreak = true;
                    smartindent = true;
                    updatetime = 300;
                    hidden = true;
                    background = "dark";
                    mousemoveevent = true;
                    smoothscroll = true;
                };

                globals = {
                    mapleader = " ";
                };

                keymaps = [
                    {
                        action = "vim.cmd.CHADopen";
                        lua = true;
                        key = "<leader>v";
                    }
                ];

                plugins = {
                    airline = {
                        enable = true;
                        powerline = true;
                        theme = "catppuccin";
                    };
                    fugitive.enable = true;
                    treesitter = {
                        enable = true;
                        ensureInstalled = [
                            "lua"
                            "rust"
                            "markdown"
                            "markdown-inline"
                            "python"
                            "cmake"
                            "cpp"
                            "c"
                        ];
                        folding = false;
                        indent = true;
                        nixvimInjections = true;
                        incrementalSelection.enable = true;
                    };
                    coq-nvim = {
                        enable = true;
                        autoStart = "shut-up";
                        installArtifacts = true;
                        recommendedKeymaps = true;
                    };
                    chadtree = {
                        enable = true;
                        keymap.openFileFolder.tertiary = ["<leader>t" "<middlemouse>"];
                    };
                    toggleterm = {
                        enable = true;
                        direction = "float";
                        openMapping = "<C-\\>";
                        shadeTerminals = true;
                        shadingFactor = 2;
                        size = 10;
                    };
                    # TODO laytan/cloak.nvim
                    gitsigns = {
                        enable = true;
                        currentLineBlame = true;
                        numhl = true;
                        signcolumn = true;
                        wordDiff = true;
                    };
                    lsp = {
                        enable = true;
                        servers = {
                            rust-analyzer = {
                                enable = true;
                                installCargo = false;
                                installRustc = false;
                            };
                            lua-ls.enable = true;
                            clangd.enable = true;
                            nil_ls.enable = true;
                            bashls.enable = true;
                        };
                        #onAttach = ''
                        #    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                        #    local bufopts = { noremap = true, silent = true, buffer = bufnr }
                        #    vim.keymap.set('n', '<space>wl', function()
                        #        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        #    end, bufopts)
                        #    vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, bufopts)
                        #'';
                        keymaps = {
                            lspBuf = {
                                gD = "declaration";
                                gd = "definition";
                                K = "hover";
                                gi = "implementation";
                                "<C-k>" = "signature_help";
                                "<leader>wa" = "add_workspace_folder";
                                "<leader>wr" = "remove_workspace_folder";
                                "<leader>wl" = "list_workspace_folders";
                                "<leader>D" = "type_definition";
                                "<leader>r" = "rename";
                                "<leader>a" = "code_action";
                                gr = "references";
                                "<C-f>" = "format";
                            };
                            diagnostic = {
                                "<leader>e" = "open_float";
                                "<leader>j" = "goto_prev";
                                "<leader>k" = "goto_next";
                                "<leader>q" = "setloclist";
                            };
                            # TODO maybe change
                            silent = false;
                        };
                    };
                    rust-tools = {
                        enable = true;
                        crateGraph = {
                            enabledGraphvizBackends = ["png" "svg"];
                            backend = "x11";
                        };
                        inlayHints = {
                            auto = true;
                            onlyCurrentLine = true;
                            showParameterHints = true;
                        };
                    };
                    leap.enable = true;
                    fidget.enable = true;
                    telescope = {
                        enable = true;
                        keymaps = {
                            "<leader>ff" = "find_files";
                            "<leader>fg" = "live_grep";
                            "<leader>fb" = "buffers";
                            "<leader>fh" = "help_tags";
                        };
                        # TODO maybe change
                        keymapsSilent = false;
                    };
                    comment-nvim.enable = true;
                    crates-nvim.enable = true;
                    harpoon = {
                        enable = true;
                        enableTelescope = true;
                        keymapsSilent = false;
                    };
                };

                extraPlugins = with pkgs.vimPlugins; [
                    zen-mode-nvim
                ];
            };
        };
    };
}

